//
//  SABUserRegisterStepThreeModelResponse.swift
//  ShipAndBox
//
//  Created by ISITA on 05/07/21.
//
import Foundation
/// Estructura para la respuesta del servidor
struct ToDo: Decodable {
    /// Resultado de tipo dataResultService que regresa el servidor
    let data: dataResultService?
    /// Estatus que regresa el servidor(0 o 1)
    let status: Int?
    /// Mensaje de respuesta del servidor
    let message: Array<String>?
}
/// Data que regresa el servidor
struct dataResultService: Decodable {
    //nombre usuario
    let names: String?
}
