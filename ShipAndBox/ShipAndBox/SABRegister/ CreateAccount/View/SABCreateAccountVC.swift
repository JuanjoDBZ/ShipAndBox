//
//  SABCreateAccountVC.swift
//  ShipAndBox
//
//  Created by ISITA on 31/08/21.
//  
//

import Foundation
import UIKit

class SABCreateAccountVC: UIViewController {

    var presenter: SABCreateAccountPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        presenter?.getInitialInfo()
    }
}
///Protocolo para recibir datos de presenter.
extension SABCreateAccountVC: SABCreateAccountViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
