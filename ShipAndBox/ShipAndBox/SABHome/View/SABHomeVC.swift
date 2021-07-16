//
//  SABHomeVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 14/07/21.
//  
//

import Foundation
import UIKit

class SABHomeVC: UIViewController {

    var presenter: SABHomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABHomeVC: SABHomeViewProtocol {
}
