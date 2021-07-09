//
//  SABUserRegisterStepThreeVC.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//
import Foundation
import UIKit
class SABUserRegisterStepThreeVC: UIViewController, YPSignatureDelegate {
    var presenter: SABUserRegisterStepThreePresenterProtocol?
    /// Obtiene el estatus de la resuesta del ws
    var statusResponse = 0
    /// Id de usuario registrado
    let customerId = 2
    var parametersCreateSignature: NSDictionary = [:]
    /// Se implementa vista de tipo YPDrawSignatureView para generar la firma
    @IBOutlet weak var viewSignatureUser: YPDrawSignatureView!
    /// Activity para esperar la caraga de datos
    @IBOutlet weak var activitySAB: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSignatureUser.delegate = self
        viewSignatureUser.layer.borderWidth = 1
        viewSignatureUser.layer.borderColor = UIColor.gray.cgColor
        activitySAB.hidesWhenStopped = true
    }
    /// Limpia la vista de la firma
    /// - Parameter sender: Any
    @IBAction func clearSignatureUser(_ sender: Any) {
        self.viewSignatureUser.clear()
    }
    /// Se genera la firma del usuario, se convierte a base64 y se envian customerId y la imagen
    @IBAction func generateSignatureUserAndSendInfo(_ sender: Any) {
        if self.viewSignatureUser.getSignature(scale: 10) != nil {
            let imageData = self.viewSignatureUser.getSignature(scale: 10)
            let imageDataSignature = imageData?.jpegData(compressionQuality: 1)
            let imageBase64StringSignatureUser = imageDataSignature?.base64EncodedString()
            let dataBase64Image = "data:image/jpeg;base64,\(imageBase64StringSignatureUser!)"
            parametersCreateSignature = [
                        "customerId": customerId,
                        "signContract": dataBase64Image
                    ]
            presenter?.sendSignatureUserSAB(parametersCreateSignature: parametersCreateSignature)
        } else {
            self.showMessage(msg:"Tienes que firmar en el recuadro")
        }
    }
    /// Funcion para generar alerta de aviso
    /// - Parameter msg: mensaje que mostrará la alerta
    func showMessage(msg:String) {
        let alert = UIAlertController(title: "Aviso", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            self.goToUserRegisterStepFour()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    /// Función para ir a la siguiente pantalla si el response es exitoso
    func goToUserRegisterStepFour() {
        if(self.statusResponse == 1) {
            self.statusResponse = 0
            presenter?.goToUserRegisterStepFour()
        } else {
            print("error")
        }
    }
    /// Permite verificar si se empieza a escribir en la vista de firma
    /// - Parameter view: vista de tipo YPDrawSignatureView
    func didStart(_ view : YPDrawSignatureView) {
    }
    /// Permite verificar si se deja de escribir en la vista de firma
    /// - Parameter view: vista de tipo YPDrawSignatureView
    func didFinish(_ view : YPDrawSignatureView) {
    }
}
///Protocolo para recibir datos de presenter.
extension SABUserRegisterStepThreeVC: SABUserRegisterStepThreeViewProtocol {
    /// Iniciar activity
    func showActivity() {
        DispatchQueue.main.async {
            self.activitySAB.startAnimating()
        }
    }
    /// Parar y ocultar activity
    func hideActivity() {
        DispatchQueue.main.async {
            self.activitySAB.stopAnimating()
            self.activitySAB.hidesWhenStopped = true
        }
    }
    /// Obtener el estatus y el mensaje
    /// - Parameters:
    ///   - status: estatus de la respuesta
    ///   - msg: mensaje de la respuesta
    func getDataInViewSAB(status:Int,msg:String) {
        DispatchQueue.main.async {
            self.statusResponse = status
            self.showMessage(msg:msg)
            self.viewSignatureUser.clear()
        }
    }
}
