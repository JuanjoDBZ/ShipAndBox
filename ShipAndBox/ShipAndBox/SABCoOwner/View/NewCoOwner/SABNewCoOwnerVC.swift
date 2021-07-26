//
//  SABNewCoOwnerVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 26/07/21.
//  
//

import Foundation
import UIKit

class SABNewCoOwnerVC: UIViewController {

    var presenter: SABNewCoOwnerPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABNewCoOwnerVC: SABNewCoOwnerViewProtocol {
}
