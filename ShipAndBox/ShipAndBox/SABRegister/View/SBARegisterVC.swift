//
//  SBARegisterVC.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation
import UIKit

class SBARegisterVC: UIViewController {
    
    var presenter: SBARegisterPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        presenter?.getInitialInfo()
    }
}
///Protocolo para recibir datos de presenter.
extension SBARegisterVC: SBARegisterViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
