//
//  SABProfileEntity.swift
//  ShipAndBox
//
//  Created by ISITA on 26/07/21.
//
import Foundation
/// Estructura para entidad de perfil
struct DataUserProfile {
    /// Id de usuario
    var customerId: Int = 0
    /// Nombre de usuario
    var names: String = ""
    /// Apellidos Usuario
    var surnames: String = ""
    ///Correo de usuario
    var email: String = ""
    /// Datos fiscales
    var addressTax = [dataResultUserProfileAddressTax]()
    /// Direccion del usuario
    var address = [dataResultUserProfileAddress]()
    /// pobox
    var pobox:dataResultUserProfilePobox?
    public init() {}
}
