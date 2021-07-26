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

    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    @IBOutlet weak var addressUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.activityStartAnimating(activityColor: UIColor.green, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        presenter?.getInfoUserProfile()
    }
    
    @IBAction func UpdateImageUserProfile(_ sender: UIButton) {
    }
    @IBAction func updateUserProfile(_ sender: UIButton) {
    }
}
///Protocolo para recibir datos de presenter.
extension SABProfileVC: SABProfileViewProtocol {
    func setDataSuccesInView(data: DataUserProfile) {
        DispatchQueue.main.async {
        self.nameUser.text = "\(data.names) \(data.surnames)"
        self.emailUser.text = data.email
        self.addressUser.text = data.surnames
            self.view.activityStopAnimating()
        }
    }
    
}
