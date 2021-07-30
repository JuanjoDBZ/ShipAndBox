//  SABCoOwnerVC.swift
//  ShipAndBox
//  Created by IsitaFS003 on 21/07/21.
import Foundation
import UIKit
/// SABCoOwnerVC
class SABCoOwnerVC: UIViewController {
    /// Objeto CollectionView.
    @IBOutlet weak var collectionCoOwner: UICollectionView!
    /// Arreglo de cotitular.
    var arrayCoOwner: Array<Any> = []
    /// Arreglo de tipo modelo.
    var modelNewCoOwner = [newPersonModel]()
    /// Array PlaceHolder cotitular.
    var arrayPlaceHolderOwner: Array = [""]
    /// Declaracion de variables  para logica de integracion de datos para consumo de servicios.
    var presenter: SABCoOwnerPresenterProtocol?
    /// Método que se llama una vez que se ha cargado la vista.
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    /// Configuración del collectionview.
    func setUpCollectionView() {
        collectionCoOwner.dataSource = self
        collectionCoOwner.delegate = self
        self.collectionCoOwner.register(UINib(nibName: "PlaceHolderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlaceHolderCollectionViewCell")
        self.collectionCoOwner.register(UINib(nibName: "CoOwnerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CoOwnerCollectionViewCell")
        collectionCoOwner.reloadData()
    }
}
///Protocolo para recibir datos de presenter.
extension SABCoOwnerVC: SABCoOwnerViewProtocol {
    func newPersonReloadCollection(newPerson: newPersonModel) {
        modelNewCoOwner.append(newPerson)
        arrayCoOwner.append(newPerson)
        collectionCoOwner.reloadData()
    }
}
extension SABCoOwnerVC: UICollectionViewDelegate,UICollectionViewDataSource {
    /// Devuelva el número de secciones en la vista.
    /// - Parameter collectionView: Un objeto que representa la vista.
    /// - Returns: El número de secciones.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    /// Pregunta a su objeto de fuente de datos la cantidad de elementos en la sección especificada.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    ///   - section: Un número de índice que identifica una sección en.
    /// - Returns: El número de elementos en section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if arrayCoOwner.count == 0 {
            if section == 0 {
                return arrayPlaceHolderOwner.count
            }else if section == 1 {
                return arrayCoOwner.count
            }
        }else{
            if section == 0 {
                return arrayCoOwner.count
            }else if section == 1 {
                return arrayPlaceHolderOwner.count
            }
        }
        return 0
    }
    ///  Este método es responsable de crear, configurar y devolver la celda apropiada para el elemento dado.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    ///   - indexPath: La ruta del índice que especifica la ubicación del elemento.
    /// - Returns: Un objeto de celda configurado. No debe regresar nilde este método.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        if section == 0 {
            if arrayCoOwner.count == 0 {
               let cellPlaceHolder = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
                return cellPlaceHolder
            }else{
                guard let cellCo = collectionView.dequeueReusableCell(withReuseIdentifier: "CoOwnerCollectionViewCell", for: indexPath) as? CoOwnerCollectionViewCell else { return UICollectionViewCell() }
                let coOwnerList = modelNewCoOwner[indexPath.row]
                let names:String = coOwnerList.name!
                let email:String = coOwnerList.email!
                let profile:String = coOwnerList.profile!
                cellCo.labelName.text = names
                cellCo.labelEmail.text = email
                cellCo.labelPlace.text = profile
                return cellCo
            }
        }else if section == 1{
            if arrayCoOwner.count <= 2 {
                let cellPlaceHolder = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
                return cellPlaceHolder
            }else{
                let cellPlaceHolder = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
                cellPlaceHolder.isHidden = true
                return cellPlaceHolder
            }
        }else{
            let cellPlaceHolder = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
            cellPlaceHolder.isHidden = true
            return cellPlaceHolder
        }
    }
    /// Le dice al delegado que se seleccionó el elemento en la ruta de índice especificada.
    /// - Parameters:
    ///   - collectionView: El objeto de vista de colección que le notifica el cambio de selección.
    ///   - indexPath: La ruta de índice de la celda que se seleccionó.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = indexPath.section
        if section == 0{
            if arrayCoOwner.count == 0 {
                presenter?.newCoOwner()
            }
        }
        if section == 1{
            presenter?.newCoOwner()
        }
    }
}
