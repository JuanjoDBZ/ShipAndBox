//  SABPaymentInformationRequestEntity.swift
//  ShipAndBox
//  Created by IsitaFS003 on 21/07/21.
import Foundation
struct DataMakePayment {
    /// Número de tarjeta del usuario para obtener token de tarjeta.
    var cardNumber: String = ""
    /// Nombre de titular  para obtener token de tarjeta.
    var holderName: String = ""
    /// Año de expiración  de tarjeta.
    var expirationYear: String = ""
    /// Mes de expiración de tarjeta.
    var expirationMonth: String = ""
    /// CVV de tarjeta de usuario.
    var cvv: String = ""
    /// customerId para obtener token de tarjeta.
    var customerId: Int = 0
    public init() {}
}
