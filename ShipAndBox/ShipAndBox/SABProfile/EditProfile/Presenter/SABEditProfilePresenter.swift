//
//  SABEditProfilePresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 28/07/21.
//  
//

import Foundation

class SABEditProfilePresenter {
    
    var view: SABEditProfileViewProtocol?
    var interactor: SABEditProfileInteractorInputProtocol?
    var router: SABEditProfileRouterProtocol?}
extension SABEditProfilePresenter: SABEditProfilePresenterProtocol {
    
}
extension SABEditProfilePresenter: SABEditProfileInteractorOutputProtocol {
    
}
