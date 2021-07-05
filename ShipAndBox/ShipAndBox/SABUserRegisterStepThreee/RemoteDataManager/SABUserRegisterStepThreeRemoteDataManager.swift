//
//  SABUserRegisterStepThreeRemoteDataManager.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//
import Foundation

class SABUserRegisterStepThreeRemoteDataManager:SABUserRegisterStepThreeRemoteDataManagerInputProtocol {
    var remoteRequestHandler: SABUserRegisterStepThreeRemoteDataManagerOutputProtocol?
    var configuration = URLSessionConfiguration()
    var session = URLSession()
    var task = URLSessionTask()
    
    func sendSignatureUserSABRemoteData(imageString: String, customerId:Int) {
        
        configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForResource = 60 //seconds
        configuration.waitsForConnectivity = true
        let params:[String: Any] = [
            "customerId":customerId,
            "signContract":imageString
        ]
        let parameters = [
            "email":"treravi@hotmail.com",
            "password":"123456789"
        ]
        
        //create the url with URL
        let url = URL(string: "http://ec2-3-136-112-167.us-east-2.compute.amazonaws.com:5001/Api/signContract")!
        //let url = URL(string: "https://ec2-3-136-112-167.us-east-2.compute.amazonaws.com:4443/Api/login")!
        
        //create the session object
        session = URLSession(configuration: configuration, delegate: self as? URLSessionDelegate, delegateQueue: nil)
        //let session = URLSession.shared
        // let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        
        
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //create dataTask using the session object to send data to the server
        task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            print("eflkjqhv")
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
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
        //print(params)
    }
    
    
    
}
