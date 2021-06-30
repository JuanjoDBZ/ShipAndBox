//
//  SABRegistroPresenter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation

class SABRegistroPresenter {
    
    var view: SABRegistroViewProtocol?
    var interactor: SABRegistroInteractorInputProtocol?
    var router: SABRegistroRouterProtocol?
    
}
extension SABRegistroPresenter: SABRegistroPresenterProtocol {
}
extension SABRegistroPresenter: SABRegistroInteractorOutputProtocol {
}
