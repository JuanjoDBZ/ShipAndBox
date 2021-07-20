//
//  SABTabBarHomePresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 15/07/21.
//  
//

import Foundation

class SABTabBarHomePresenter {
    
    var view: SABTabBarHomeViewProtocol?
    var interactor: SABTabBarHomeInteractorInputProtocol?
    var router: SABTabBarHomeRouterProtocol?
    
}
extension SABTabBarHomePresenter: SABTabBarHomePresenterProtocol {
}
extension SABTabBarHomePresenter: SABTabBarHomeInteractorOutputProtocol {
}
