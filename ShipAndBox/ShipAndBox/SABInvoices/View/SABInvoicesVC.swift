//
//  SABInvoicesVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 02/08/21.
//  
//

import Foundation
import UIKit

class SABInvoicesVC: UIViewController {

    var presenter: SABInvoicesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABInvoicesVC: SABInvoicesViewProtocol {
}
