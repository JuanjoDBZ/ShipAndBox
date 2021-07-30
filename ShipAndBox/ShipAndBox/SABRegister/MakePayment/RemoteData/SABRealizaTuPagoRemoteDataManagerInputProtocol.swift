//
//  SABRealizaTuPagoRemoteDataManagerInputProtocol.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 06/07/21.
//
import UIKit
import OpenpayKit
class SABRealizaTuPagoRemoteDataManagerInputProtocol: NSObject {
    /// MERCHANT_ID.
    static let MERCHANT_ID = "mehujw2houaa7pzmqc9f"
    /// API_KEY.
    static let API_KEY = "pk_4e224c9395034a79a5a1d2b6c8d573e4"
    /// FramWork Openpay.
    var openpay : Openpay!
    /// Id Session de openpay.
    var sessionID: String = ""
    /// Token Id openpay.
    var tokenID: String = ""
    /// Modelo de pago de datos.
    var TokenCard: DataMakePayment = DataMakePayment()
    /// CVV de tarjeta de usuario.
    var cvvCardForm = "cvv"
    /// Nombre de titular de la tarjeta.
    var nameForm = "holderName"
    /// customerId para obtener token de tarjeta.
    var customerId: Int = 0
    /// Funcion para el llamado de servicio getTypePaysMemberships y nos traega los tipos de membrecias.
    /// - Parameters:
    ///   - objectType: Nos regresara el tipo de resultado adquirido.
    ///   - completion: Tendremos  la informacion jsonDecoder para su manipulacion.
    func getTypePaysMemberships<T: Decodable>( objectType: T.Type, completion: @escaping (EnumsRequestAndErrors.Result<T>) -> Void) {
        let url = URL(string: "https://ec2-3-136-112-167.us-east-2.compute.amazonaws.com:4443/Api/getTypePaysMemberships")!
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
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
                let jsonDecoder = JSONDecoder()
                let decodedResponse = try jsonDecoder.decode(objectType.self,from: data)
                print(decodedResponse)
                completion(EnumsRequestAndErrors.Result.success(decodedObject))
            } catch let error {
                completion(EnumsRequestAndErrors.Result.failure(EnumsRequestAndErrors.APPError.jsonParsingError(error as! DecodingError)))
            }
        })
        task.resume()
    }
    /// Funcion para inicializar openPay y crear  la sessionID.
    /// - Parameter parametersCreateToken: Datos del usuario para el consumo de servicios.
    func inicializarOpenPay(parametersCreateToken: DataMakePayment) {
        TokenCard = parametersCreateToken
        openpay = Openpay(withMerchantId: SABRealizaTuPagoRemoteDataManagerInputProtocol.MERCHANT_ID, andApiKey: SABRealizaTuPagoRemoteDataManagerInputProtocol.API_KEY, isProductionMode: false, isDebug: false,countryCode: "MX")
        openpay.createDeviceSessionId(successFunction: successSessionID, failureFunction: failSessionID)
    }
    /// Funcion que inicialisa el el metodo de tokenizarTarjeta y obtenemos el sessionID.
    /// - Parameter sessionID: Data de sessionID.
    func successSessionID(sessionID: String) {
        self.sessionID = sessionID
        tokenizarTarjeta()
    }
    /// Funcion que nos regresar si existe un error.
    /// - Parameter error: descripcion del error.
    func failSessionID(error: NSError) {
        print("\(error.code) - \(error.localizedDescription)")
    }
    /// Funcion que nos regresa el Token para el OprenPay y manda llamar el metodo postPayMembership.
    /// - Returns: Regresa el token.
    func tokenizarTarjeta() -> Void {
        /// Número de la tarjeta.
        var dataCardNumberForm = ""
        /// Año de expiración de la tarjeta.
        var dataExpYearCardForm = ""
        /// Mes de expiración de la tarjeta.
        var dataExpMonthCardForm = ""
        /// Cvv de la tarjeta.
        var dataCvvCardForm = ""
        /// Nombre del titular de la tarjeta.
        var dataNameForm = ""
        dataCardNumberForm = TokenCard.cardNumber
        dataExpYearCardForm = TokenCard.expirationYear
        dataExpMonthCardForm = TokenCard.expirationMonth
        dataCvvCardForm = TokenCard.cvv
        dataNameForm = TokenCard.holderName
        customerId = TokenCard.customerId
        /// Solicitud de tarjeta para traer el token.
        let card = TokenizeCardRequest(cardNumber: dataCardNumberForm,holderName:dataNameForm, expirationYear: dataExpYearCardForm, expirationMonth: dataExpMonthCardForm, cvv2: dataCvvCardForm)
        openpay.tokenizeCard(card: card) { (OPToken) in
            self.tokenID = OPToken.id
            print(OPToken.id)
            self.postPayMembership()
        } failureFunction: { (NSError) in
            print(NSError)
        }
    }
    /// Funcion para el llamado el servicio payMembership para verificar que se realizo el pago
    func postPayMembership() {
        let semaphore = DispatchSemaphore (value: 0)
        let parameters: NSDictionary = [
            "DeviceSessionId": sessionID,
            "TokenOpenPay": tokenID,
            "CustomerId":TokenCard.customerId,
            "MembershipTypeId":"1",
            "TotalMembership":"105"
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        var request = URLRequest(url: URL(string: "https://ec2-3-136-112-167.us-east-2.compute.amazonaws.com:4443/Api/payMembership")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer ", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil, let respuesta = response as?
                    HTTPURLResponse else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            if respuesta.statusCode == 200 {
                print("traemos datos:\(data)")
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        for item in json {
                            print(item)
                        }
                    }
                }catch{
                    print("error cagante:\(error.localizedDescription)")
                }
            }else{
                print("error:\(respuesta.statusCode)")
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
}
extension SABRealizaTuPagoRemoteDataManagerInputProtocol:URLSessionDelegate {
    /// Funcion delegada urlSession que  permite ala palicacion confiar en los servicios
    /// - Parameters:
    ///   - session: Realizar cargas y descargas de contenido en segundo plano
    ///   - challenge: Resive la autenticacion
    ///   - completionHandler: Regresa el proceso de confianda del delegado
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
    /// Funcion que nos dice si el fallo en el consumo con el URLSession
    /// - Parameters:
    ///   - session: Descripcion de session
    ///   - error: Descripcion del error
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        // tenemos un error
        if let err = error {
            print("Error: URLSessionDelegate \(err.localizedDescription)")
        }
    }
}
