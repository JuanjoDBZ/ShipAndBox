//
//  SABNewCoOwnerVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 27/07/21.
//  
//

import Foundation
import UIKit
protocol NewPersonProtocol: class {
    func saveNewPerson(persona:newPersonModel)
}

class SABNewCoOwnerVC: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtProfile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    var presenter: SABNewCoOwnerPresenterProtocol?
    var delegate:NewPersonProtocol?
    var arrayPerson = [String]()
    var newPerson: newPersonModel = newPersonModel()

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSavePerson(_ sender: Any) {

        newPerson.name = txtFullName.text
        newPerson.email = txtEmail.text
        newPerson.profile = txtProfile.text
//        let name = txtFullName.text
//        let profile = txtProfile.text
//        let email = txtEmail.text
//        arrayPerson.append(name!)
//        arrayPerson.append(profile!)
//        arrayPerson.append(email!)
        delegate?.saveNewPerson(persona: newPerson)
        self.navigationController?.popViewController(animated: true)
    }
}
///Protocolo para recibir datos de presenter.
extension SABNewCoOwnerVC: SABNewCoOwnerViewProtocol {
}
