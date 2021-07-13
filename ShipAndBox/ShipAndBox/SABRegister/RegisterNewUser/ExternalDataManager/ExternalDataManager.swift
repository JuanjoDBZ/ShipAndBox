//
//  ExternalDataManager.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//
import Foundation
import UIKit
class ExternalDataManager: NSObject, URLSessionDelegate {
    public func autenticar<T: Decodable>(with documents: [String:String], objectType: T.Type, completion: @escaping (EnumsRequestAndErrors.Result<T>) -> Void) {
        guard let ineFront = documents["IneFront"] else { return }
        guard let ineBack = documents["IneBack"] else { return }
        guard let faceCustomer = documents["FaceCustomer"] else { return }
        let parameters = [
            "IneBack":  ineBack,
            "FaceCustomer": faceCustomer,
            "IneFront": ineFront
        ]
        //create the url with URL
        let url = URL(string: "https://ec2-3-136-112-167.us-east-2.compute.amazonaws.com:4443/Api/validateDocument")!
        //create the session object
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //create dataTask using the session object to send data to the server
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
                 //create decodable object from data
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(EnumsRequestAndErrors.Result.success(decodedObject))
             } catch let error {
                completion(EnumsRequestAndErrors.Result.failure(EnumsRequestAndErrors.APPError.jsonParsingError(error as! DecodingError)))
             }
         })
        task.resume()
    }
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
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
