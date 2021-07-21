//
//  SABProfileVC.swift
//  ShipAndBox
//
//  Created by ISITA on 21/07/21.
//  
//

import Foundation
import UIKit

class SABProfileVC: UIViewController {

    var presenter: SABProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        presenter?.getInitialInfo()
    }
}
///Protocolo para recibir datos de presenter.
extension SABProfileVC: SABProfileViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
