//
//  PlaceHolderCollectionViewCellRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 23/07/21.
//
import Foundation
class PlaceHolderCollectionViewCellRouter {
    public var view: PlaceHolderCollectionViewCell
    private var presenter: PlaceHolderCollectionViewCellPresenter
    private var interactor: PlaceHolderCollectionViewCellInteractor
    init() {
        self.view = PlaceHolderCollectionViewCell()
        self.presenter = PlaceHolderCollectionViewCellPresenter()
        self.interactor = PlaceHolderCollectionViewCellInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension PlaceHolderCollectionViewCellRouter: PlaceHolderCollectionViewCellRouterProtocol {
    func createNewCoOwner() {
        let configView = SABNewCoOwnerRouter().view

        configView.modalPresentationStyle = .fullScreen
            
        configView.present(configView, animated: true, completion: nil)
//        let RegisterGenerateSignatureVC = SABNewCoOwnerRouter().view
//        self.view.navigationController?.pushViewController(RegisterGenerateSignatureVC, animated: true)
    }
    
}
