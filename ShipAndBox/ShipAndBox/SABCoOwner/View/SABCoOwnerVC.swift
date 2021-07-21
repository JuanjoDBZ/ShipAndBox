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
    
    var presenter: SABCoOwnerPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setUpCollectionView() {
        self.collectionCoOwner.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customReuseIdentifier")
    }
}
///Protocolo para recibir datos de presenter.
extension SABCoOwnerVC: SABCoOwnerViewProtocol {
}
extension SABCoOwnerVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCoOwner.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SABCoOwnerCollectionViewCell", for: indexPath) as! SABCoOwnerCollectionViewCell
        return cell
    }
}
