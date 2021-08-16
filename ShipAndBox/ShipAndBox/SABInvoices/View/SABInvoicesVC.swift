//  SABInvoicesVC.swift
//  ShipAndBox
//  Created by IsitaFS003 on 03/08/21.
import Foundation
import UIKit
class SABInvoicesVC: UIViewController {
    /// Objeto CollectionView.
   @IBOutlet weak var collectionInvoices: UICollectionView!
    /// Declaracion de variables  para logica de integracion de datos para consumo de servicios.
    var presenter: SABInvoicesPresenterProtocol?
    /// Array facturas
//    var arrayInvoice = [String]()
    var arrayInvoice = ["",""]
    /// Método que se llama una vez que se ha cargado la vista.
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollection()
    }
    func setUpCollection() {
        collectionInvoices.dataSource = self
        collectionInvoices.delegate = self
        self.collectionInvoices.register(UINib(nibName: "SABInvoiceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SABInvoiceCollectionViewCell")
        collectionInvoices.reloadData()
    }
}
///Protocolo para recibir datos de presenter.
extension SABInvoicesVC: SABInvoicesViewProtocol {
}
extension SABInvoicesVC: UICollectionViewDelegate, UICollectionViewDataSource{
    /// Pregunta a su objeto de fuente de datos la cantidad de elementos en la sección especificada.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    ///   - section: Un número de índice que identifica una sección en.
    /// - Returns: El número de elementos en la sección.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayInvoice.count
    }
    ///  Este método es responsable de crear, configurar y devolver la celda apropiada para el elemento dado.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    ///   - indexPath: La ruta del índice que especifica la ubicación del elemento.
    /// - Returns: Un objeto de celda configurado.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellCo = collectionView.dequeueReusableCell(withReuseIdentifier: "SABInvoiceCollectionViewCell", for: indexPath) as? SABInvoiceCollectionViewCell else { return UICollectionViewCell()
        }
        return cellCo
    }
}
