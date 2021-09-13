//
//  SABMembershipVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 13/09/21.
//  
//

import Foundation
import UIKit

class SABMembershipVC: UIViewController {

    var presenter: SABMembershipPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABMembershipVC: SABMembershipViewProtocol {
}
