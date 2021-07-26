//
//  PlaceHolderCollectionViewCell.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 22/07/21.
//
import UIKit
class PlaceHolderCollectionViewCell: UICollectionViewCell {
    var presenter: PlaceHolderCollectionViewCellPresenterProtocol?
    @IBOutlet weak var viewConteiner: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    func setUpView() {
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = UIColor.black.cgColor
        yourViewBorder.lineDashPattern = [3, 3]
        yourViewBorder.frame = viewConteiner.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: viewConteiner.bounds).cgPath
        viewConteiner.layer.addSublayer(yourViewBorder)
    }
    @IBAction func buttonAddCoOwner(_ sender: UIButton) {
        print("boton co owner entro")
            presenter?.newCoOwner()
        
    }
}
///Protocolo para recibir datos de presenter.
extension PlaceHolderCollectionViewCell: PlaceHolderCollectionViewCellViewProtocol {
}
