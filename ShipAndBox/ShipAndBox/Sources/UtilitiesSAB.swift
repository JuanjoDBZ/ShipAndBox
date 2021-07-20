//
//  urlPathSAB.swift
//  ShipAndBox
//
//  Created by ISITA on 06/07/21.
//

import Foundation
import UIKit
/// Clase para crear una url
class UtilitiesSAB {
    static let api = UtilitiesSAB()
    /// Esquema
    let scheme = "https://"
    /// Url del servidor
    let host = "ec2-3-136-112-167.us-east-2.compute.amazonaws.com:4443/Api/"
    /// Funcion para retornar una url
    /// - Parameter path: complemeto de la url
    /// - Returns: retorna una url
    func urlComposerApi(path: String) -> URL {
        let urlPathApi = URL(string: "\(scheme)\(host)\(path)")
        return urlPathApi!
    }
    /// Función para generar alerta de aviso erroneo
    /// - Parameter msg: mensaje de error
    func showMessageError(msg:String, controller:UIViewController) {
        let alert = UIAlertController(title: "Aviso", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
