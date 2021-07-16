//
//  SABTabBarHomeVC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 15/07/21.
//  
//
import Foundation
import UIKit
class SABTabBarHomeVC: UIViewController {
    /// Declaracion de objetos y variables
    var presenter: SABTabBarHomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigatorBar()
    }
    func setUpNavigatorBar() {
        /// Boton para perfil
        let profileButton = UIButton(type: .custom)
        profileButton.setImage(UIImage(systemName: "house"), for: .normal)
        profileButton.addTarget(self, action: #selector(self.profileSelector), for: .touchUpInside)
        profileButton.contentMode = .scaleToFill
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileButton)
        /// boton para busqueda
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        let imageeeew = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        let imagee = UIImage(named: "search")
        imageeeew.image = imagee
        searchButton.setImage(imageeeew.image, for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        /// imagen logo
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    @objc func profileSelector()  {
        print("entro")
    }
}
class facturaViewContrller: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
class comprasViewContrller: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
class cotitularViewContrller: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
///Protocolo para recibir datos de presenter.
extension SABTabBarHomeVC: SABTabBarHomeViewProtocol {
}
