//
//  SABInvoicesPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 02/08/21.
//  
//

import Foundation

class SABInvoicesPresenter {
    
    var view: SABInvoicesViewProtocol?
    var interactor: SABInvoicesInteractorInputProtocol?
    var router: SABInvoicesRouterProtocol?
    
}
extension SABInvoicesPresenter: SABInvoicesPresenterProtocol {
}
extension SABInvoicesPresenter: SABInvoicesInteractorOutputProtocol {
}
