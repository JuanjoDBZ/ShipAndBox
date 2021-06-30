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

   
    var presenter: SABChangePasswordPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABChangePasswordVC: SABChangePasswordViewProtocol {
}
