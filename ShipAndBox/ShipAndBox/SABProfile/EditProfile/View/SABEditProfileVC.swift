//
//  SABEditProfileVC.swift
//  ShipAndBox
//
//  Created by ISITA on 28/07/21.
//  
//

import Foundation
import UIKit
class SABEditProfileVC: UIViewController {
    var presenter: SABEditProfilePresenterProtocol?
    /// Nombre de usuario
    @IBOutlet weak var txtName: UITextField!
    /// Email del usuario
    @IBOutlet weak var txtEmail: UITextField!
    /// Número de celular
    @IBOutlet weak var txtMobile: UITextField!
    /// Número de teléfono
    @IBOutlet weak var txtPhone: UITextField!
    /// Contiene los datos recibidos del usuario
    var GetDataUserProfile = DataUserProfile()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataUserInfoInTextFieldUserInfo()
    }
    /// Obtener datos del usuario a editar
    func setDataUserInfoInTextFieldUserInfo(){
        self.txtName.text = GetDataUserProfile.names
        self.txtEmail.text = GetDataUserProfile.email
    }
}
///Protocolo para recibir datos de presenter.
extension SABEditProfileVC: SABEditProfileViewProtocol {
}
