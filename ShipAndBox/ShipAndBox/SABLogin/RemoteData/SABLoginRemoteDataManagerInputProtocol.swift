//
//  SABLoginRemoteDataManagerInputProtocol.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 01/07/21.
//
import Foundation
/// Clase que se encarga de las llamadas al servicio de modulo Login
class SABLoginRemoteDataManagerInputProtocol:NSObject  {
    /// Funcion que llama el servicio de login
    /// - Parameter params: Parametros que se enviaran al servicio
    func GetDatalogin( params: NSDictionary){
        let url = "https://ec2-3-136-112-167.us-east-2.compute.amazonaws.com:4443/Api/login"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request){(data,respose,error) in
            guard let data = data, error == nil, let respuesta = respose as?
                    HTTPURLResponse else{
                print(" error: \(String(describing: error))")
                return
            }
            if respuesta.statusCode == 200 {
                print("traemos datos:\(data)")
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                    }
                }catch{
                    print("error:\(error.localizedDescription)")
                }
            }else{
                print("error:\(respuesta.statusCode)")
            }
        }.resume()
    }
}
extension SABLoginRemoteDataManagerInputProtocol:URLSessionDelegate {
    /// Funcion que permite la autenticación a un servidor
    /// - Parameters:
    ///   - session: permite cargar los datos ala url
    ///   - challenge: respuesta ala autenticación del servidor 
    ///   - completionHandler: Regresa la peticion que sele hiso al servidor
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        /// Tenemos un URLAuthenticationChallenge, confiamos en el servidor  y procedemos
        let authMethod = challenge.protectionSpace.authenticationMethod
        guard challenge.previousFailureCount < 1, authMethod == NSURLAuthenticationMethodServerTrust,
            let trust = challenge.protectionSpace.serverTrust else {
                completionHandler(.performDefaultHandling, nil)
                return
        }
        completionHandler(.useCredential, URLCredential(trust: trust))
    }
    /// Funcion que nos dice en que falla la aplicacion
    /// - Parameters:
    ///   - session: El objeto de sesión invalidado.
    ///   - error: Descripcion del error
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        if let err = error {
            print("Error: URLSessionDelegate \(err.localizedDescription)")
        }
    }
}
