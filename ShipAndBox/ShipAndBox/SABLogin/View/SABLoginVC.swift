//  SABLoginVC.swift
//  ShipAndBox
//  Created by IsitaFS003 on 30/06/21.
import Foundation
import UIKit
class SABLoginVC: UIViewController {
    ///  Uitext contraseña del usuario.
    @IBOutlet weak var txtPassword: UITextField!
    /// Uitext nombre del usuario.
    @IBOutlet weak var txtUserName: UITextField!
    /// Boton olvidaste tu contraseña.
    @IBOutlet weak var buttonForgotPassword: UIButton!
    /// Boton registrate.
    @IBOutlet weak var buttonSignIn: UIButton!
    /// Boton login.
    @IBOutlet weak var buttonLogin: UIButton!
    /// Protocolo que define los métodos y atributos para el Presenter.
    var presenter: SABLoginPresenterProtocol?
    /// Variable correo.
    var userId:Int = 0
    /// Variable contraseña.
    var password:String = ""
    /// Funcion que se llama después de que la vista del controlador se cargue en la memoria.
    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        super.viewDidLoad()
        setUpNavigatorBar()
    }
    /// Función que de la Configuración al NavigatorBar.
    func setUpNavigatorBar() {
        let profileButton = UIButton(type: .custom)
        profileButton.setImage(UIImage(systemName: "house"), for: .normal)
        profileButton.addTarget(self, action: #selector(self.menu), for: .touchUpInside)
        profileButton.contentMode = .scaleToFill
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileButton)
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(systemName: "folder"), for: .normal)
        searchButton.addTarget(self, action: #selector(self.menu), for: .touchUpInside)
        searchButton.contentMode = .scaleToFill
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        let imageViewLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        imageViewLogo.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageViewLogo.image = image
        navigationItem.titleView = imageViewLogo
    }
    /// Funcion que abre el menu.
    @objc func menu()  {
        print("Aqui abrira el menu")
    }
    /// Función para envió de parámetros para el consumo de servicio de login.
    func loginUser(){
        if  txtPassword.text == "" || txtUserName.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Usuario y/o Contraseña no validos.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            if let usrName = txtUserName.text {
                let idUser = Int(usrName)
                userId = idUser!
            }
            if let usrPassword = txtPassword.text {
                password = usrPassword
            }
            presenter?.loginUser(userId:userId,usrPassword:password)
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
}
///Protocolo para recibir datos de presenter.
extension SABLoginVC: SABLoginViewProtocol {
    /// Función que trae los datos del servicio login y permite acceso a vista home
    /// - Parameter resultLogin: Datos Decodable para su uso
    func resulSetLoginView(resultLogin: dataLoginResultSerive) {
        DispatchQueue.main.async {
                self.presenter?.showHome()
        }
    }
}
