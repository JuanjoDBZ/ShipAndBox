//
//  SABLoginRemoteDataManagerInputProtocol.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 01/07/21.
//
import Foundation
/// Clase que se encarga de las llamadas al servicio de módulo Login.
class SABLoginRemoteDataManagerInputProtocol:NSObject  {
    /// Función que llama el servicio de login.
    /// - Parameter params: Parámetros que se enviaran al servicio.
    func GetDatalogin<T: Decodable>( objectType: T.Type, params: NSDictionary, completion: @escaping (EnumsRequestAndErrors.Result<T>) -> Void) {
        /// path para complemetar la url
        let path = "login"
        /// Url construida para consumir
        let url = UtilitiesSAB.api.urlComposerApi(path: path)
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        request.httpBody = jsonData
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
                let jsonDecoder = JSONDecoder()
                let decodedResponse = try jsonDecoder.decode(objectType.self,from: data)
                print(decodedResponse)
                completion(EnumsRequestAndErrors.Result.success(decodedResponse))
            } catch let error {
                completion(EnumsRequestAndErrors.Result.failure(EnumsRequestAndErrors.APPError.jsonParsingError(error as! DecodingError)))
            }
        })
        task.resume()
    }
}
extension SABLoginRemoteDataManagerInputProtocol:URLSessionDelegate {
    /// Función que permite la autenticación a un servidor.
    /// - Parameters:
    ///   - session: permite cargar los datos ala url.
    ///   - challenge: respuesta ala autenticación del servidor.
    ///   - completionHandler: Regresa la petición que se le hizo al servidor.
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        /// Tenemos un URLAuthenticationChallenge, confiamos en el servidor  y procedemos.
        let authMethod = challenge.protectionSpace.authenticationMethod
        guard challenge.previousFailureCount < 1, authMethod == NSURLAuthenticationMethodServerTrust,
            let trust = challenge.protectionSpace.serverTrust else {
                completionHandler(.performDefaultHandling, nil)
                return
        }
        completionHandler(.useCredential, URLCredential(trust: trust))
    }
    /// Función que nos dice en que falla la aplicación.
    /// - Parameters:
    ///   - session: El objeto de sesión invalidado.
    ///   - error: Descripción del error.
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        if let err = error {
            print("Error: URLSessionDelegate \(err.localizedDescription)")
        }
    }
}
