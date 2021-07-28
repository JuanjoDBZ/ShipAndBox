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
    var arrayCoOwner: Array<Any> = []
    var modelNewCoOwner = [newPersonModel]()

    var arrayPlaceHolderOwner: Array = [""]
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
        modelNewCoOwner.append(newPerson)
        arrayCoOwner.append(newPerson)
        collectionCoOwner.reloadData()
    }
}
extension SABCoOwnerVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        if section == 0 {
            if arrayCoOwner.count == 0 {
               let cellPlaceHolder = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
                return cellPlaceHolder
            }else{
                let cellCo = collectionView.dequeueReusableCell(withReuseIdentifier:"CoOwnerCollectionViewCell", for: indexPath) as! CoOwnerCollectionViewCell
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
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
