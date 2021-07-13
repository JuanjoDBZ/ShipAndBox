//
//  Enums.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 13/07/21.
//

import Foundation
public class EnumsRequestAndErrors {
    ////APPError enum which shows all possible errors
    enum APPError: Error {
        case networkError(Error)
        case dataNotFound
        case jsonParsingError(Error)
        case invalidStatusCode(Int)
    }
    ////Result enum to show success or failure
    enum Result<T> {
        case success(T)
        case failure(APPError)
    }
}
