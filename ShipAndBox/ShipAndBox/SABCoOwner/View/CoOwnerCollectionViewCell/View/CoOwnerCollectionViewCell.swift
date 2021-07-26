//
//  CoOwnerCollectionViewCell.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 22/07/21.
//

import UIKit

class CoOwnerCollectionViewCell: UICollectionViewCell {

    var presenter: CoOwnerCollectionViewCellPresenterProtocol?
    @IBOutlet weak var buttonGroup: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonNewGroup(_ sender: UIButton) {
        print("entro")
    }
}
///Protocolo para recibir datos de presenter.
extension CoOwnerCollectionViewCell: CoOwnerCollectionViewCellViewProtocol {
}
