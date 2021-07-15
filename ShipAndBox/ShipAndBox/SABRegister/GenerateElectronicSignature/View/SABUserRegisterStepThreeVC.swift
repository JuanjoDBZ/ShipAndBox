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
    /// Id de usuario registrado
    var customerId = 2
    /// Parametros que se envian para ejecutar el servicio de generar firma electrónica
    var parametersCreateSignature: NSDictionary = [:]
    /// Se implementa vista de tipo YPDrawSignatureView para generar la firma
    @IBOutlet weak var viewSignatureUser: YPDrawSignatureView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSignatureUser.delegate = self
        viewSignatureUser.layer.borderWidth = 1
        viewSignatureUser.layer.borderColor = UIColor.gray.cgColor
    }
    /// Limpia la vista de la firma
    /// - Parameter sender: Contiene la información del botón que se pulsa
    @IBAction func clearSignatureUser(_ sender: UIButton) {
        self.viewSignatureUser.clear()
    }
    /// Se genera la firma del usuario, se convierte a base64 y se envian customerId y la imagen
    @IBAction func generateSignatureUserAndSendInfo(_ sender: UIButton) {
        if self.viewSignatureUser.getSignature(scale: 10) != nil {
            let imageData = self.viewSignatureUser.getSignature(scale: 10)
            let imageDataSignature = imageData?.jpegData(compressionQuality: 1)
            if let imageBase64StringSignatureUser = imageDataSignature?.base64EncodedString(){
                let dataBase64Image = "data:image/jpeg;base64,\(imageBase64StringSignatureUser)"
                parametersCreateSignature = [
                    "customerId": customerId,
                    "signContract": dataBase64Image
                ]
                presenter?.sendSignatureUserSAB(parametersCreateSignature: parametersCreateSignature)
            }
        } else {
            UtilitiesSAB.api.showMessageError(msg: "Tienes que firmar en el recuadro", controller: self)
        }
    }
    /// Función para generar alerta de aviso satisfactorio
    /// - Parameter msg: mensaje que mostrará la alerta
    func showMessageSucces(msg:String) {
        let alert = UIAlertController(title: "Aviso", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            self.viewSignatureUser.clear()
            self.presenter?.goToUserRegisterStepFour(customerId:self.customerId)
        }))
        self.present(alert, animated: true, completion: nil)
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
    /// Función satisfactoría si se obtiene un 1
    /// - Parameter msg: mensaje satisfactorio
    func resposeSuccesRegisterStepThreeView(msg:String) {
        DispatchQueue.main.async {
            self.showMessageSucces(msg: msg)
        }
    }
    /// función de error si la respuesta manda 0
    /// - Parameter msgError: mensaje de errors
    func resposeErrorRegisterStepThreeView(msgError:String) {
        DispatchQueue.main.async {
            self.viewSignatureUser.clear()
            UtilitiesSAB.api.showMessageError(msg: msgError, controller: self)
        }
    }
    /// Iniciar activity
    func showActivity() {
        DispatchQueue.main.async {
            self.view.activityStartAnimating(activityColor: UIColor.green, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        }
    }
    /// Parar y ocultar activity
    func hideActivity() {
        DispatchQueue.main.async {
            self.view.activityStopAnimating()
        }
    }
}
