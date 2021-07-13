//
//  SABRegisterStep4VC.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 02/07/21.
//  
//

import Foundation
import UIKit
class SABRealizaTuPagoVC: UIViewController {
    /// Declaracion de IBOutlet de la vista
    @IBOutlet weak var txtTypeMemberShip: UITextField!
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var labelNumber: UITextField!
    @IBOutlet weak var labelYear: UITextField!
    @IBOutlet weak var labelMonth: UITextField!
    @IBOutlet weak var labelCVV: UITextField!
    @IBOutlet weak var labelStreet: UITextField!
    @IBOutlet weak var labelColony: UITextField!
    @IBOutlet weak var labelCode: UITextField!
    @IBOutlet weak var labelTown: UITextField!
    @IBOutlet weak var labelState: UITextField!
    @IBOutlet weak var labelMembership: UITextField!
    @IBOutlet weak var labelAmount: UITextField!
    /// Declaracion de variables  para logica de integracion de datos para consumo de servicios 
    var presenter: SABRealizaTuPagoPresenterProtocol?
    var parametersCreateToken: NSDictionary = [:]
    var cvvCardForm:String = ""
    var nameForm:String = ""
    var expMonthCardForm:String = ""
    var expYearCardForm:String = ""
    var cardNumberForm:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        getServicesTypeMember()
    }
    /// Funcion para consumir el servicio getTypePaysMemberships
    func getServicesTypeMember() {
        presenter?.getTypeMember()
    }
    /// Funcion para pasar los datos de la tarjeta y consumir servicos para OpenPay
    func openPay() {
        if let cvv = labelCVV.text {
            cvvCardForm = cvv
        }
        if let holderName = labelName.text {
            nameForm = holderName
        }
        if let expirationMonth = labelMonth.text{
            expMonthCardForm = expirationMonth
        }
        if let expirationYear = labelYear.text{
            expYearCardForm = expirationYear
        }
        if let cardNumber = labelNumber.text{
            cardNumberForm = cardNumber
        }
        parametersCreateToken = [
            "cardNumber": cardNumberForm,
            "holderName": nameForm,
            "expirationYear":expYearCardForm,
            "expirationMonth":expMonthCardForm,
            "cvv":cvvCardForm
        ]
        presenter?.openpay(parametersCreateToken: parametersCreateToken)
    }
    /// Boton que manda llamar metodo para activar la logica de openpay``
    /// - Parameter sender: Objeto boton del sistema
    @IBAction func buttonPayMemberShip(_ sender: UIButton) {
        openPay()
    }
}
///Protocolo para recibir datos de presenter.
extension SABRealizaTuPagoVC: SABRealizaTuPagoViewProtocol {
    /// Con este metodo podremos llenar la informacion de los tipos de membrecia que retorno el servicio getTypePaysMemberships
    /// - Parameter resultMembership: Contiene el data del servicio getTypePaysMemberships
    func resulsetPaysMembershipView(resultMembership: [dataResultSerive]) {
        print(resultMembership)
    }
}
