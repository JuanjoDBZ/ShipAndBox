//
//  SABLoginVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//

import Foundation
import UIKit

class SABLoginVC: UIViewController {

    @IBOutlet weak var lbltest: UILabel!
    var presenter: SABLoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABLoginVC: SABLoginViewProtocol {
}
