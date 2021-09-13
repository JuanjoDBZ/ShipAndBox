//
//  SABMembershipPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 13/09/21.
//  
//

import Foundation

class SABMembershipPresenter {
    
    var view: SABMembershipViewProtocol?
    var interactor: SABMembershipInteractorInputProtocol?
    var router: SABMembershipRouterProtocol?
    
}
extension SABMembershipPresenter: SABMembershipPresenterProtocol {
}
extension SABMembershipPresenter: SABMembershipInteractorOutputProtocol {
}
