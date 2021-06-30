//
//  SABRegistroVC.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation
import UIKit

class SABRegistroVC: UIViewController {

    var presenter: SABRegistroPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABRegistroVC: SABRegistroViewProtocol {
}
