//
//  SABUserRegisterStepThreeModelResponse.swift
//  ShipAndBox
//
//  Created by ISITA on 05/07/21.
//

import Foundation

struct SABUserRegisterStepThreeModelResponse: Codable {
    var status:Int
    var message = [String]()
    var data: [String]? = []
}
