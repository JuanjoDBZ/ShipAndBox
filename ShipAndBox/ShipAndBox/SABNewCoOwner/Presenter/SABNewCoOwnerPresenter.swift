//
//  SABNewCoOwnerPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 27/07/21.
//  
//

import Foundation

class SABNewCoOwnerPresenter {
    
    var view: SABNewCoOwnerViewProtocol?
    var interactor: SABNewCoOwnerInteractorInputProtocol?
    var router: SABNewCoOwnerRouterProtocol?
    
}
extension SABNewCoOwnerPresenter: SABNewCoOwnerPresenterProtocol {
}
extension SABNewCoOwnerPresenter: SABNewCoOwnerInteractorOutputProtocol {
}
