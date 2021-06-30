//
//  SABChangePasswordPresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 30/06/21.
//  
//

import Foundation

class SABChangePasswordPresenter {
    
    var view: SABChangePasswordViewProtocol?
    var interactor: SABChangePasswordInteractorInputProtocol?
    var router: SABChangePasswordRouterProtocol?
    
}
extension SABChangePasswordPresenter: SABChangePasswordPresenterProtocol {
}
extension SABChangePasswordPresenter: SABChangePasswordInteractorOutputProtocol {
}
