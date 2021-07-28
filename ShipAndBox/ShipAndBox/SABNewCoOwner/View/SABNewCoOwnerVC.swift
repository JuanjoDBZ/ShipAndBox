//
//  SABNewCoOwnerVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 27/07/21.
//  
//

import Foundation
import UIKit
class SABNewCoOwnerVC: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtProfile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtCP: UITextField!
    var presenter: SABNewCoOwnerPresenterProtocol?
    var arrayPerson = [String]()
    var newPerson: newPersonModel = newPersonModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonSavePerson(_ sender: Any) {

        newPerson.name = txtFullName.text
        newPerson.email = txtEmail.text
        newPerson.profile = txtProfile.text
        newPerson.address = txtAddress.text
        newPerson.city = txtCity.text
        newPerson.cp = txtCP.text
        newPerson.state = txtState.text
        self.navigationController?.popViewController(animated: true)
    }
}
///Protocolo para recibir datos de presenter.
extension SABNewCoOwnerVC: SABNewCoOwnerViewProtocol {
}
