//
//  SABCoOwnerVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 21/07/21.
//  
//
import Foundation
import UIKit
/// SABCoOwnerVC
class SABCoOwnerVC: UIViewController {
    /// Objeto CollectionView
    @IBOutlet weak var collectionCoOwner: UICollectionView!
    var arrayCoOwner: Array<Any> = ["",""]
    var arrayPlaceHolderOwner: Array = ["",""]
    var arrayNewCoOwner: newPersonModel = newPersonModel()
    var presenter: SABCoOwnerPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
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
    func prueba2(newPerson: newPersonModel) {
        arrayNewCoOwner = newPerson
        collectionCoOwner.reloadData()

    }
}
extension SABCoOwnerVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayCoOwner.count
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return arrayCoOwner.count
        }
        else if section == 1 {
            return arrayPlaceHolderOwner.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell? = nil
        let section = indexPath.section
        if section == 0 {
            let cellCo = collectionView.dequeueReusableCell(withReuseIdentifier:"CoOwnerCollectionViewCell", for: indexPath) as! CoOwnerCollectionViewCell
            cellCo.labelEmail.text = arrayNewCoOwner.email
            cellCo.labelName.text = arrayNewCoOwner.name
            cellCo.labelPlace.text = arrayNewCoOwner.profile
            return cellCo
        }
        else if section == 1{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
            return cell!
        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let section = indexPath.section
        if section == 0{
            print("CoOwner")
        }else if section == 1{
            print("place")
            presenter?.newCoOwner()
        }
    }
}
extension SABCoOwnerVC: NewPersonProtocol{
    func saveNewPerson(persona: newPersonModel) {
        print("prirmjrnokenfowenf")
    }
}
