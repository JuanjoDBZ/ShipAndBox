//
//  CoOwnerCollectionViewCellRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 23/07/21.
//
import Foundation
class CoOwnerCollectionViewCellRouter {
    public var view: CoOwnerCollectionViewCell
    private var presenter: CoOwnerCollectionViewCellPresenter
    private var interactor: CoOwnerCollectionViewCellInteractor
    init() {
        self.view = CoOwnerCollectionViewCell()
        self.presenter = CoOwnerCollectionViewCellPresenter()
        self.interactor = CoOwnerCollectionViewCellInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension CoOwnerCollectionViewCellRouter: CoOwnerCollectionViewCellRouterProtocol {
}
