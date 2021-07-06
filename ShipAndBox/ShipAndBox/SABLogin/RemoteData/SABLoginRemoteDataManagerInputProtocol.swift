//
//  SABLoginRemoteDataManagerInputProtocol.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 01/07/21.
//

import Foundation

class SABLoginRemoteDataManagerInputProtocol:NSObject  {

    //hacer la llamada al servidor (consumo de servicio)
    typealias CompletionHandler = (_ success:Bool,_ responseFromRequest:String)->Void
    var requestCompletion:CompletionHandler?

    func GetDatalogin( params: NSDictionary,completion:@escaping CompletionHandler){
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
        requestCompletion = completion
    }
}

extension SABLoginRemoteDataManagerInputProtocol:URLSessionDelegate {
    
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
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        // tenemos un error
        if let err = error {
            print("Error: URLSessionDelegate \(err.localizedDescription)")
        } else {
//            if requestCompletion != nil {
//                requestCompletion!(true,completeResponse)
//            }
        }
        
    }
}
