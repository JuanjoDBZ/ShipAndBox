//
//  SABPaymentInformationRequestEntity.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 21/07/21.
//
import Foundation
struct DataMakePayment {
    /// Numero de tarjeta
    var cardNumber: String = ""
    /// Nombre de titular
    var holderName: String = ""
    /// Año de expiración
    var expirationYear: String = ""
    /// Mes de expiración
    var expirationMonth: String = ""
    /// CVV
    var cvv: String = ""
    /// customerId
    var customerId: Int = 0
    public init() {}
}
