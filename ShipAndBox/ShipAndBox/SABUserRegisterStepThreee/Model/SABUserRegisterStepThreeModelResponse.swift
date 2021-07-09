//
//  SABUserRegisterStepThreeModelResponse.swift
//  ShipAndBox
//
//  Created by ISITA on 05/07/21.
//
import Foundation
/// Estructura para la respuesta del servidor
struct ToDo: Decodable {
    let data: dataResultService?
    let status: Int?
    let message: Array<String>?
}
struct dataResultService: Decodable {
    let names: String?
    let surnames: String?
    let typeDocument: String?
    let validDocument: String?
    let idNumberDocument: String?
    let dateExpiration: String?
    let personalNumber: String?
}
