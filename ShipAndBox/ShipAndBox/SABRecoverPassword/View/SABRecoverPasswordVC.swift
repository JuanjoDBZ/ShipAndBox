//
//  SABRecoverPasswordVC.swift
//  ShipAndBox
//
//  Created by ISITA on 30/08/21.
//  
//

import Foundation
import UIKit

class SABRecoverPasswordVC: UIViewController {

    var presenter: SABRecoverPasswordPresenterProtocol?
    
    /// Vista principal
    @IBOutlet var principalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        presenter?.getInitialInfo()
        self.principalView.backgroundColor = UIColor(patternImage: UIImage(named: "logo-color")!)
    }
}
///Protocolo para recibir datos de presenter.
extension SABRecoverPasswordVC: SABRecoverPasswordViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
