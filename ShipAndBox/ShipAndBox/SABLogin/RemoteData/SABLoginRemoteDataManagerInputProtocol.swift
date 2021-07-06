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

    func urlSession(_ session: URLSession,

             didReceive challenge: URLAuthenticationChallenge,
                completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            guard challenge.previousFailureCount == 0 else {
                challenge.sender?.cancel(challenge)
                // Inform the user that the user name and password are incorrect
                completionHandler(.cancelAuthenticationChallenge, nil)
                return

            }



            // Within your authentication handler delegate method, you should check to see if the challenge protection space has an authentication type of NSURLAuthenticationMethodServerTrust

            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust

               // and if so, obtain the serverTrust information from that protection space.

               && challenge.protectionSpace.serverTrust != nil

               && challenge.protectionSpace.host == "ec2-3-136-112-167.us-east-2.compute.amazonaws.com" {

                let proposedCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

                completionHandler(URLSession.AuthChallengeDisposition.useCredential, proposedCredential)

            }

        }
    
}
