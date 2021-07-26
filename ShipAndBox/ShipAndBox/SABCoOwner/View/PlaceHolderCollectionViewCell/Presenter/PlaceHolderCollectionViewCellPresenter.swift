//
//  PlaceHolderCollectionViewCellPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 23/07/21.
//
import Foundation
class PlaceHolderCollectionViewCellPresenter {
    
    var view: PlaceHolderCollectionViewCellViewProtocol?
    var interactor: PlaceHolderCollectionViewCellInteractorInputProtocol?
    var router: PlaceHolderCollectionViewCellRouterProtocol?
    
}
extension PlaceHolderCollectionViewCellPresenter: PlaceHolderCollectionViewCellPresenterProtocol {
    func newCoOwner() {
        router?.createNewCoOwner()
    }
}
extension PlaceHolderCollectionViewCellPresenter: PlaceHolderCollectionViewCellInteractorOutputProtocol {
}
