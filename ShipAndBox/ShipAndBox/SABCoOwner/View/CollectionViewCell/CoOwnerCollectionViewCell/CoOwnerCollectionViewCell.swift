//
//  CoOwnerCollectionViewCell.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 22/07/21.
//

import UIKit

class CoOwnerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPlace: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var buttonGroup: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonNewGroup(_ sender: UIButton) {
        print("entro")
    }
}

