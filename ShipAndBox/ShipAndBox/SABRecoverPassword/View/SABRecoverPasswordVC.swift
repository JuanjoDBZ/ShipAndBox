//
//  SABRecoverPasswordVC.swift
//  ShipAndBox
//
//  Created by ISITA on 30/08/21.
//  
//

import Foundation
import UIKit

class SABRecoverPasswordVC: UIViewController {
    /// Email de recuperación
    @IBOutlet weak var txtEmailRecover: UITextField!
    var presenter: SABRecoverPasswordPresenterProtocol?
    /// Vista principal
    @IBOutlet var principalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        presenter?.getInitialInfo()
        self.principalView.backgroundColor = UIColor(patternImage: UIImage(named: "logo-color")!)
        setUpNavBar()
    }
    func setUpNavBar(){
        //For title in navigation bar
        self.navigationItem.title = "Recuperar Contraseña"

        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Atrás"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    /// Enviar correo para recuperar contraseña
    /// - Parameter sender: información del botón pulsado
    @IBAction func sendEmailRecoverPwd(_ sender: UIButton) {
        if txtEmailRecover.text != "" {
            if let emailUser =  txtEmailRecover.text{
                presenter?.recoverPassword(email: emailUser)
            }
        } else {
            UtilitiesSAB.api.showMessageError(msg:"El campo de correo electrónico no debe estar vacío", controller: self)
        }
    }
}
///Protocolo para recibir datos de presenter.
extension SABRecoverPasswordVC: SABRecoverPasswordViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
