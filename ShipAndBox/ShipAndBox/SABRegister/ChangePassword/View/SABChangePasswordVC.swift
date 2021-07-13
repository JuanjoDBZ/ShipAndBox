//
//  SABChangePasswordVC.swift
//  ShipAndBox
//
//  Created by ISITA on 30/06/21.
//  
//

import Foundation
import UIKit
class SABChangePasswordVC: UIViewController {
    ///Caja de texto para poner correo
    @IBOutlet weak var txtEmailUser: UITextField!
    var presenter: SABChangePasswordPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView();
        let image = UIImage(named: "email.png");
        imageView.image = image;
        self.txtEmailUser.leftView = imageView;
        presenter?.getInitialInfo()
    }
    /// Funión para enviar corro
    /// - Parameter sender: recupera acción del botón
    @IBAction func sendEmailRecuperatePassword(_ sender: UIButton) {
    }
}
///Protocolo para recibir datos de presenter.
extension SABChangePasswordVC: SABChangePasswordViewProtocol {
    func loadInfo(){
    }
}
