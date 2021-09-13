//  SABCoOwnerVC.swift
//  ShipAndBox
//  Created by IsitaFS003 on 21/07/21.
import Foundation
import UIKit
/// SABCoOwnerVC
class SABCoOwnerVC: UIViewController {
    /// Objeto CollectionView.
    /// Arreglo de cotitular.
    var arrayCoOwner = [newPersonModel]()
    /// Arreglo de tipo modelo.
    var modelNewCoOwner = [newPersonModel]()
    /// Array PlaceHolder cotitular.
    var arrayPlaceHolderOwner = [String]()
    /// Declaracion de variables  para logica de integracion de datos para consumo de servicios.
    var presenter: SABCoOwnerPresenterProtocol?
    /// Método que se llama una vez que se ha cargado la vista.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
///Protocolo para recibir datos de presenter.
extension SABCoOwnerVC: SABCoOwnerViewProtocol {
    func newPersonReloadCollection(newPerson: newPersonModel) {
        modelNewCoOwner.append(newPerson)
        arrayCoOwner.append(newPerson)
    }
}
