//
//  SABHomePresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 14/07/21.
//  
//

import Foundation

class SABHomePresenter {
    
    var view: SABHomeViewProtocol?
    var interactor: SABHomeInteractorInputProtocol?
    var router: SABHomeRouterProtocol?
    
}
extension SABHomePresenter: SABHomePresenterProtocol {
}
extension SABHomePresenter: SABHomeInteractorOutputProtocol {
}
