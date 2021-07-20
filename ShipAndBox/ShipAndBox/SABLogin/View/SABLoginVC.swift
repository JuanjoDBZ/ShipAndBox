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
    /// Declaracion de objetos y variables  para la vista.
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var buttonForgotPassword: UIButton!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    var presenter: SABLoginPresenterProtocol?
    var protocolView: SABLoginViewProtocol?
    var email:String = ""
    var password:String = ""
    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        super.viewDidLoad()
    }
    /// Función para envió de parámetros para el consumo de servicio de login.
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
    /// Función para ingresar ala aplicación.
    /// - Parameter sender: Objeto del programa.
    @IBAction func buttonGetIn(_ sender: UIButton) {
        loginUser()
    }
    /// Función para ingresar a vistas para el registro ala aplicación.
    /// - Parameter sender: Objeto del programa.
    @IBAction func buttonMakeYourPaymnet(_ sender: UIButton) {
        presenter?.registerNewUser()
    }
    class secondViewContrller: UIViewController {
        override func viewDidLoad(){
            super.viewDidLoad()
            view.backgroundColor = .blue
        }
    }
    class thirdViewContrller: UIViewController {
        override func viewDidLoad(){
            super.viewDidLoad()
            view.backgroundColor = .green
        }
    }
}
///Protocolo para recibir datos de presenter.
extension SABLoginVC: SABLoginViewProtocol {
    /// Función que trae los datos del servicio login y permite acceso a vista home
    /// - Parameter resultLogin: Datos Decodable para su uso
    func resulSetLoginView(resultLogin: dataLoginResultSerive) {
        print(resultLogin)
        DispatchQueue.main.async {
            if  resultLogin.email == self.email {
                self.presenter?.showHome()
            }
        }
    }
}
