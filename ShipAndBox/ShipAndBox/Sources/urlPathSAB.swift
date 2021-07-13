//
//  urlPathSAB.swift
//  ShipAndBox
//
//  Created by ISITA on 06/07/21.
//

import Foundation
/// Clase para crear una url
class urlPathSAB {
    static let api = urlPathSAB()
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
    
}
