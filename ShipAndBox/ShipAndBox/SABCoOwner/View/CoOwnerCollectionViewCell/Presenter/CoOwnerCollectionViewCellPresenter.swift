//
//  CoOwnerCollectionViewCellPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 23/07/21.
//

import Foundation
class CoOwnerCollectionViewCellPresenter {
    
    var view: CoOwnerCollectionViewCellViewProtocol?
    var interactor: CoOwnerCollectionViewCellInteractorInputProtocol?
    var router: CoOwnerCollectionViewCellRouterProtocol?
    
}
extension CoOwnerCollectionViewCellPresenter: CoOwnerCollectionViewCellPresenterProtocol {
}
extension CoOwnerCollectionViewCellPresenter: CoOwnerCollectionViewCellInteractorOutputProtocol {
}
