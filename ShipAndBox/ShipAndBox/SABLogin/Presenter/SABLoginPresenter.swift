//
//  SABLoginPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//

import Foundation

class SABLoginPresenter {
    
    var view: SABLoginViewProtocol?
    var interactor: SABLoginInteractorInputProtocol?
    var router: SABLoginRouterProtocol?
    
}
extension SABLoginPresenter: SABLoginPresenterProtocol {
}
extension SABLoginPresenter: SABLoginInteractorOutputProtocol {
}
