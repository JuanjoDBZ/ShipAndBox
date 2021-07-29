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
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    var GetDataUserProfile = DataUserProfile()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataUserInfoInTextFieldUserInfo()
    }
    func setDataUserInfoInTextFieldUserInfo(){
        self.txtName.text = GetDataUserProfile.names
        self.txtEmail.text = GetDataUserProfile.email
    }
}
///Protocolo para recibir datos de presenter.
extension SABEditProfileVC: SABEditProfileViewProtocol {
}
