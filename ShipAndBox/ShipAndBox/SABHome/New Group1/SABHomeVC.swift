//
//  SABHomeVC.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//
import Foundation
import UIKit
class SABHomeVC: UIViewController {
    var presenter: SABHomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /// Función para ocultar navegation
    /// - Parameter animated: parametro que se envía para ocultar la barra de navegación
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    /// Función para ocultar navegation
    /// - Parameter animated: parametro que se envía para ocultar la barra de navegación
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    /// Ir a la siguiente pantalla que contiene una webview
    /// - Parameter sender: Contiene la información del botón que se pulsa
    @IBAction func goToWebViewSab(_ sender: Any) {
        presenter?.openWebViewSab()
    }
}
///Protocolo para recibir datos de presenter.
extension SABHomeVC: SABHomeViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
