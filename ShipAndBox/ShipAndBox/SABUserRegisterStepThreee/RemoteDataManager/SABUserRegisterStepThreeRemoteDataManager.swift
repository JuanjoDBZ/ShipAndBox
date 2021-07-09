//
//  SABUserRegisterStepThreeRemoteDataManager.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//
import Foundation

class SABUserRegisterStepThreeRemoteDataManager:NSObject, SABUserRegisterStepThreeRemoteDataManagerInputProtocol,URLSessionDelegate {
    var remoteRequestHandler: SABUserRegisterStepThreeRemoteDataManagerOutputProtocol?
    var StepThreeModelResponse =  [SABUserRegisterStepThreeModelResponse]()
    
    /// Función para consultar el ws
    /// - Parameter parametersCreateSignature: Se envia la firma y el id del usuario
    func sendSignatureUserSABRemoteData(parametersCreateSignature: NSDictionary) {
        /// path para complemetar la url
        let path = "signContract"
        /// Url construida para consumir
        let url = urlPathSAB.api.urlComposerApi(path: path)
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parametersCreateSignature, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let res = try decoder.decode(SABUserRegisterStepThreeModelResponse.self, from: data)
                self.StepThreeModelResponse =   [res]
                self.remoteRequestHandler?.remoteDataManagerResponseStatusSendSignature(responseSignature: self.StepThreeModelResponse)
            } catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
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
