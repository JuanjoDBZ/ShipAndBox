//
//  SABWWebViewHomeVC.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//
import Foundation
import UIKit
import WebKit
class SABWWebViewHomeVC: UIViewController{
    var presenter: SABWWebViewHomePresenterProtocol?
    /// Url para la webview
    let url = "https://login.shipandbox.com/"
    /// web view para mostrar la página
    @IBOutlet weak var webViewHome: WKWebView!
    /// Icono para ir hacia atrás
    @IBOutlet weak var imageViewBack: UIImageView!
    /// Icono para ir hacia adelante
    @IBOutlet weak var imageViewNext: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Llamar función para ir hacia atrás
        let tapGRback = UITapGestureRecognizer(target: self, action: #selector(self.imageTappedBack))
        imageViewBack.addGestureRecognizer(tapGRback)
        imageViewBack.isUserInteractionEnabled = true
        /// Llamar función para ir hacia adelante
        let tapGRnext = UITapGestureRecognizer(target: self, action: #selector(self.imageTappedNext))
        imageViewNext.addGestureRecognizer(tapGRnext)
        imageViewNext.isUserInteractionEnabled = true
        let request = URLRequest(url: URL(string: url)!)
        webViewHome.load(request)
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
    /// Función para ir hacia atrás
    @objc func imageTappedBack(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            webViewHome.goBack()
        }
    }
    /// Función para ir hacia adelante
    @objc func imageTappedNext(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            webViewHome.goForward()
        }
    }
}
///Protocolo para recibir datos de presenter.
extension SABWWebViewHomeVC: SABWWebViewHomeViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
