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
    /// Imagen de usuario
    @IBOutlet weak var imgUserProfile: UIImageView!
    /// Nombre de usuario
    @IBOutlet weak var nameUser: UILabel!
    /// Email de usuario
    @IBOutlet weak var emailUser: UILabel!
    /// Dirección de usuario
    @IBOutlet weak var addressUser: UILabel!
    /// Dirección de usuario
    var dataAddressProfile = [dataResultUserProfileAddress]()
    /// Datos de usuario
    var GetDataUserProfile = DataUserProfile()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.activityStartAnimating(activityColor: UIColor.green, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        presenter?.getInfoUserProfile()
    }
    
    @IBAction func UpdateImageUserProfile(_ sender: UIButton) {
    }
    /// Editar datos del usuario
    /// - Parameter sender: Contiene la información del botón que se pulsa
    @IBAction func updateUserProfile(_ sender: UIButton) {
        presenter?.editUserProfile(data: self.GetDataUserProfile)
    }
}
///Protocolo para recibir datos de presenter.
extension SABProfileVC: SABProfileViewProtocol {
    func setDataSuccesInView(data: DataUserProfile) {
        DispatchQueue.main.async {
        self.GetDataUserProfile = data
        self.dataAddressProfile = data.address
        self.nameUser.text = "\(data.names) \(data.surnames)"
        self.emailUser.text = data.email
        self.addressUser.text = data.surnames
            self.view.activityStopAnimating()
        }
    }
    
}
