//  SABNewCoOwnerVC.swift
//  ShipAndBox
//  Created by IsitaFS003 on 27/07/21.
import Foundation
import UIKit
class SABNewCoOwnerVC: UIViewController {
    /// Nombre completo cotitular.
    @IBOutlet weak var txtFullName: UITextField!
    /// Perfil del cotitular.
    @IBOutlet weak var txtProfile: UITextField!
    /// Correo del cotitular.
    @IBOutlet weak var txtEmail: UITextField!
    /// Dirección del cotitular.
    @IBOutlet weak var txtAddress: UITextField!
    /// Ciudad del cotitular.
    @IBOutlet weak var txtCity: UITextField!
    /// Estado del cotitular.
    @IBOutlet weak var txtState: UITextField!
    /// CP del cotitular.
    @IBOutlet weak var txtCP: UITextField!
    /// // Protocolo que define los métodos y atributos para el Presenter.
    var presenter: SABNewCoOwnerPresenterProtocol?
    /// Varible tipo newPersonModel.
    var newPerson: newPersonModel = newPersonModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /// Boton para guardar la informacion.
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
