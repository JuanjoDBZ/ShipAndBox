//
//  RequestIformationRemoteData.swift
//  ShipAndBox
//
//  Created by ISITA on 15/07/21.
//

import Foundation
class RequestIformationRemoteData:NSObject,URLSessionDelegate {
    /// Función para consultar el ws
    /// - Parameter parametersCreateSignature: Se envia la firma y el id del usuario
    func registerNewUser<T: Decodable>(params: DataUserRegister, objectType: T.Type, completion: @escaping (EnumsRequestAndErrors.Result<T>) -> Void) {
        var BackIne = ""
        if params.typeDocument == "I" {
            BackIne = params.backIne
        }
        let params_register = [
            "TypeDocument":params.typeDocument,
            "email":params.email,
            "password":params.password,
            "RepeatPassword":params.repeatPassword,
            "Names":params.names,
            "Surnames":params.surnames,
            "Phone":params.phone,
            "CellPhone":params.cellPhone,
            "IdNumberIne":params.idNumberIne,
            "DateExpirationIne":"2022-01-01",
            "Address":params.address,
            "Zipcode":params.zipCode,
            "Suburb":params.suburb,
            "City":params.city,
            "State":params.state,
            "Country":params.country,
            "Latitude":params.latitude,
            "Longitude":params.longitude,
            "ProofAddress":params.proofAddress,
            "FrontIne":params.frontIne,
            "BackIne":BackIne,
            "FacePhoto":params.facePhoto
        ]
        /// path para complemetar la url
        let path = "registerCustomer"
        /// Url construida para consumir
        let url = UtilitiesSAB.api.urlComposerApi(path: path)
        print(url)
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params_register, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
             guard error == nil else {
                completion(EnumsRequestAndErrors.Result.failure(EnumsRequestAndErrors.APPError.networkError(error!)))
                 return
             }
             guard let data = data else {
                completion(EnumsRequestAndErrors.Result.failure(EnumsRequestAndErrors.APPError.dataNotFound))
                 return
             }
             do {
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(EnumsRequestAndErrors.Result.success(decodedObject))
             } catch let error {
                completion(EnumsRequestAndErrors.Result.failure(EnumsRequestAndErrors.APPError.jsonParsingError(error as! DecodingError)))
             }
         })
        task.resume()
    }
    /// Función que permite la autenticación a un servidor
        /// - Parameters:
        ///   - session: permite cargar los datos a la url
        ///   - challenge: respuesta a la autenticación del servidor
        ///   - completionHandler: Regresa la petición que se hace al servidor
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard challenge.previousFailureCount == 0 else {
            challenge.sender?.cancel(challenge)
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust
            && challenge.protectionSpace.serverTrust != nil
            && challenge.protectionSpace.host == "ec2-3-136-112-167.us-east-2.compute.amazonaws.com" {
            let proposedCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(URLSession.AuthChallengeDisposition.useCredential, proposedCredential)
        }
    }
    
}
