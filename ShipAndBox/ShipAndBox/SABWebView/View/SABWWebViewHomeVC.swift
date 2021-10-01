//
//  SABWWebViewHomeVC.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation
import UIKit

class SABWWebViewHomeVC: UIViewController {

    var presenter: SABWWebViewHomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        presenter?.getInitialInfo()
    }
}
///Protocolo para recibir datos de presenter.
extension SABWWebViewHomeVC: SABWWebViewHomeViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
