//
//  SABRegisterVC.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 01/07/21.
//  
//

import Foundation
import UIKit
import iOSDropDown

class SABRegisterVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var viewStepOne: UIView!
    @IBOutlet weak var viewStepTwo: UIView!
    @IBOutlet weak var viewStepThree: UIView!
    @IBOutlet weak var viewStepFour: UIView!
    @IBOutlet weak var dropDownIdentification: DropDown!
    @IBOutlet weak var btnTakePicture: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var lblInstructions: UILabel!
    @IBOutlet weak var stackImages: UIStackView!
    @IBOutlet weak var imageFrontINE: UIImageView!
    @IBOutlet weak var imageBackINE: UIImageView!
    @IBOutlet weak var segmentCameraArchive: UISegmentedControl!
    var dataUserRegister: DataUserRegister = DataUserRegister()
    var imageBase64 = Data()
    var dictIneImages: [String: String] = [:]
    let arrayDrowDownOption = ["INE", "PASAPORTE"]
    var ineFront: String = ""
    var ineBack: String  = ""
    var faceCustomer: String = ""
    var presenter: SABRegisterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSupStepView()
        setUpDropDown()
        setUpButtons()
        setUpLabels()
        presenter?.getInitialInfo()
        dropDownIdentification.didSelect{(selectedText , index ,id) in
            if index == 0 {
                self.lblInstructions.text = "Tome la foto de la parte frontal del INE."
            } else {
                self.lblInstructions.text = "Tome la foto del pasaporte."
            }
        }
    }
    func setUpButtons() {
        btnTakePicture.setTitle("TOMAR FOTO", for: .normal)
        btnContinue.setTitle("SIGUIENTE", for: .normal)
        stackImages.layer.borderWidth = 0.5
    }
    func setUpDropDown() {
        dropDownIdentification.optionArray = arrayDrowDownOption
        dropDownIdentification.selectedRowColor = UIColor.systemBackground
        dropDownIdentification.text = arrayDrowDownOption[0]
        dropDownIdentification.selectedIndex = 0
    }
    func setSupStepView() {
        viewStepOne.layer.cornerRadius = 25
        viewStepTwo.layer.cornerRadius = 25
        viewStepThree.layer.cornerRadius = 25
        viewStepFour.layer.cornerRadius = 25
    }
    func setUpLabels() {
        lblInstructions.text = "Tome la foto de la parte frontal del INE."
    }
    @IBAction func segmentedControlButtonClickAction(_ sender: UISegmentedControl) {
        if dropDownIdentification.selectedIndex == 0 {
            if sender.selectedSegmentIndex == 0 {
             lblInstructions.text = "Tome la foto de la parte frontal del INE."
             btnTakePicture.setTitle("TOMAR FOTO", for: .normal)
            } else {
             lblInstructions.text = "Ingrese la imagen frontal del INE."
             btnTakePicture.setTitle("AGREGAR IMAGEN", for: .normal)
            }
        } else {
            if sender.selectedSegmentIndex == 0 {
             lblInstructions.text = "Tome la foto del pasaporte."
             btnTakePicture.setTitle("TOMAR FOTO", for: .normal)
            } else {
             lblInstructions.text = "Ingrese la imagen del pasaporte."
             btnTakePicture.setTitle("AGREGAR IMAGEN", for: .normal)
            }
        }
    }
    @IBAction func takePhotoAddImages(_ sender: UIButton) {
        if segmentCameraArchive.selectedSegmentIndex == 0 {
            let imageIneVc = UIImagePickerController()
            imageIneVc.sourceType = .camera
            imageIneVc.delegate = self
            imageIneVc.allowsEditing = true
            present(imageIneVc, animated: true)
        } else {
            if imageBackINE.image == nil {
                let imageIneVc = UIImagePickerController()
                imageIneVc.sourceType = .photoLibrary
                imageIneVc.delegate = self
                imageIneVc.allowsEditing = true
                present(imageIneVc, animated: true)
            } else {
                let imageIneVc = UIImagePickerController()
                imageIneVc.sourceType = .photoLibrary
                imageIneVc.delegate = self
                imageIneVc.allowsEditing = true
                present(imageIneVc, animated: true)
            }
        }
    }
    @IBAction func actionContinue(_ sender: UIButton) {
        self.view.activityStartAnimating(activityColor: UIColor.green, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        presenter?.validateDocuments(documents: dictIneImages)
    }
}
///Protocolo para recibir datos de presenter.
extension SABRegisterVC: SABRegisterViewProtocol {
    func errorResponseRegisterNewUser(error: String) {
        DispatchQueue.main.async {
            self.view.activityStopAnimating()
            UtilitiesSAB.api.showMessageError(msg: error, controller: self)
        }
    }
    
    func succesResponseRegisterNewUser(data: DataUserRegister) {
        DispatchQueue.main.async {
            self.presenter?.goToStepTwoRegisterNewUser(data: data)
            self.view.activityStopAnimating()
        }
        
    }
    
    func loadInfo() {
        print("Realizar acciones de repintado de la vista")
    }
}
extension SABRegisterVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            if dropDownIdentification.selectedIndex == 0 {
                if imageFrontINE.image == nil {
                    imageFrontINE.image = image
                    if let imageBase64 = image.jpegData(compressionQuality: 1)?.base64EncodedString() {
                        let imageBase = "data:image/jpeg;base64,\(imageBase64)"
                        dataUserRegister.frontIne = imageBase
                        ineFront = imageBase
                        dictIneImages["IneFront"] = imageBase
                        lblInstructions.text = "Tome la foto de la parte trasera del INE."
                    }
                } else if imageBackINE.image == nil {
                    imageBackINE.image = image
                    if let imageBase64 = image.jpegData(compressionQuality: 1)?.base64EncodedString() {
                        let imageBase =  "data:image/jpeg;base64,\(imageBase64)"
                        ineBack = imageBase
                        dataUserRegister.backIne = imageBase
                        dictIneImages["IneBack"] = imageBase
                        lblInstructions.text = "Tome la foto de su rostro para validar la informacion."
                    }
                } else {
                    if let imageBase64 = image.jpegData(compressionQuality: 1)?.base64EncodedString() {
                        let imageBase =  "data:image/jpeg;base64,\(imageBase64)"
                        faceCustomer = imageBase
                        dataUserRegister.facePhoto = imageBase
                        dictIneImages["FaceCustomer"] = imageBase
                        lblInstructions.text = "Pulse siguiente para continuar con el registro."
                    }
                }
            } else {
                if imageFrontINE.image == nil {
                    imageFrontINE.image = image
                    if let imageBase64 = image.jpegData(compressionQuality: 1)?.base64EncodedString() {
                        let imageBase = "data:image/jpeg;base64,\(imageBase64)"
                        ineFront = imageBase
                        dictIneImages["IneFront"] = imageBase
                        lblInstructions.text = "Tome la foto de su rostro para validar la informacion."
                    }
                } else {
                    if let imageBase64 = image.jpegData(compressionQuality: 1)?.base64EncodedString() {
                        let imageBase =  "data:image/jpeg;base64,\(imageBase64)"
                        faceCustomer = imageBase
                        dictIneImages["FaceCustomer"] = imageBase
                        lblInstructions.text = "Pulse siguiente para continuar con el registro."
                    }
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
