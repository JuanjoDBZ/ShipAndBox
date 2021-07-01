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

    @IBOutlet weak var txtEmailUser: UITextField!
    
    var presenter: SABChangePasswordPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        presenter?.getInitialInfo()
    }
    
    
    
    @IBAction func sendEmailRecuperatePassword(_ sender: Any) {
        print("Enviar email")
    }
    
    
    
    
    
}



///Protocolo para recibir datos de presenter.
extension SABChangePasswordVC: SABChangePasswordViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
