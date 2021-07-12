//
//  SABLoginVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//
import Foundation
import UIKit
class SABLoginVC: UIViewController {
    /// Declaracion de objetos para la vista
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var buttonForgotPassword: UIButton!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    var presenter: SABLoginPresenterProtocol?
    var email:String = ""
    var password:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /// Funcion para envio de parametros para el consumo de servicio de login
    func loginUser(){     
        if  txtPassword.text == "" || txtUserName.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Usuario y/o Contraseña no validos.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            if let usrName = txtUserName.text {
                email = usrName
            }
            if let usrPassword = txtPassword.text {
                password = usrPassword
            }
            presenter?.loginUser(usrEmail:email,usrPassword:password)
        }
    }
    /// Funcion para ingresar ala aplicacion
    /// - Parameter sender: Objeto del programa
    @IBAction func buttonGetIn(_ sender: UIButton) {
        loginUser()
    }
    /// Funcion para ingresar a vistas para el registro ala aplicacion 
    /// - Parameter sender: Objeto del programa
    @IBAction func buttonMakeYourPaymnet(_ sender: UIButton) {
    }
}
///Protocolo para recibir datos de presenter.
extension SABLoginVC: SABLoginViewProtocol {
}
