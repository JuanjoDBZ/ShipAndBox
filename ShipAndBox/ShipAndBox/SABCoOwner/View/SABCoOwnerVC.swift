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
    var arrayCoOwner: Array = [""]
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
}
extension SABCoOwnerVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayCoOwner.count
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return arrayCoOwner.count
        }
        else {
            return arrayPlaceHolderOwner.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell? = nil
        let section = indexPath.section

        if section == 0 {
            if arrayCoOwner.count <= 1 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
                return cell!
            }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CoOwnerCollectionViewCell", for: indexPath)
            return cell!
            }
        }
       else if section == 1{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PlaceHolderCollectionViewCell", for: indexPath)
            return cell!
        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
