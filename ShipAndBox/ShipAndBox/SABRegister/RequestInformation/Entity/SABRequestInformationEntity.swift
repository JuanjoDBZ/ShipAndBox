//
//  SABRequestInformationEntity.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 08/07/21.
//

import Foundation
struct DataUserRegister {
    /// Usuario
    var typeDocument: String = ""
    /// Correo del usuario
    var email: String = ""
    /// Folio de autorización.
    var password: String = ""
    /// Indicador si el usuario esta migrado
    var repeatPassword: String = ""
    /// Codigo recibido por sms
    var names: String = ""
    /// Codigo recibido por correo
    var surnames: String = ""
    /// Codigo recibido por correo
    var phone: String = ""
    /// Token para validar el cambio de contraseña.
    var cellPhone: String = ""
    /// Token para validar el cambio de contraseña.
    var idNumberIne: String = ""
    /// Token para validar el cambio de contraseña.
    var dateExpirationIne: String = ""
    /// Token para validar el cambio de contraseña.
    var address: String = ""
    /// Token para validar el cambio de contraseña.
    var zipCode: String = ""
    /// Token para validar el cambio de contraseña.
    var suburb: String = ""
    /// Token para validar el cambio de contraseña.
    var city: String = ""
    /// Token para validar el cambio de contraseña.
    var state: String = ""
    /// Token para validar el cambio de contraseña.
    var country: String = ""
    /// Token para validar el cambio de contraseña.
    var latitude: String = ""
    /// Token para validar el cambio de contraseña.
    var longitude: String = ""
    /// Token para validar el cambio de contraseña.
    var proofAddress: String = ""
    /// Token para validar el cambio de contraseña.
    var frontIne: String = ""
    /// Token para validar el cambio de contraseña.
    var backIne: String = ""
    /// Token para validar el cambio de contraseña.
    var facePhoto: String = ""
    public init() {}
}
