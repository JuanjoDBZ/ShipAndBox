//
//  SABCoOwnerPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 21/07/21.
//  
//

import Foundation

class SABCoOwnerPresenter {
    
    var view: SABCoOwnerViewProtocol?
    var interactor: SABCoOwnerInteractorInputProtocol?
    var router: SABCoOwnerRouterProtocol?
    
}
extension SABCoOwnerPresenter: SABCoOwnerPresenterProtocol {
}
extension SABCoOwnerPresenter: SABCoOwnerInteractorOutputProtocol {
}
