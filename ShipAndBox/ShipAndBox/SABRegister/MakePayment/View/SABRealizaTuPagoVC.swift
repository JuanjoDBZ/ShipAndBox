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
    /// Textfield de la membresía
    @IBOutlet weak var txtTypeMemberShip: UITextField!
    /// Textfield de monto
    @IBOutlet weak var txtAmount: UITextField!
    /// Textfield nombre del usuario
    @IBOutlet weak var txtName: UITextField!
    /// Textfield numero de tarjeta
    @IBOutlet weak var txtNumber: UITextField!
    /// Textfield año de expiración de tarjeta
    @IBOutlet weak var txtYear: UITextField!
    /// Textfield mes de expiración de mes
    @IBOutlet weak var txtMonth: UITextField!
    /// Textfield  para ingresar  CVV
    @IBOutlet weak var txtCVV: UITextField!
    /// Textfield para ingresar  calle
    @IBOutlet weak var txtStreet: UITextField!
    /// Textfield para ingresar colonia
    @IBOutlet weak var txtColony: UITextField!
    /// Textfield para codigo postal
    @IBOutlet weak var txtCode: UITextField!
    /// Textfield para ingresar ciudad
    @IBOutlet weak var txtTown: UITextField!
    /// Textfield para ingresar estado
    @IBOutlet weak var txtState: UITextField!
    /// Textfield para ingresar tipo de membresía
    @IBOutlet weak var txtMembership: UITextField!
    /// Declaracion de variables  para logica de integracion de datos para consumo de servicios
    var presenter: SABRealizaTuPagoPresenterProtocol?
    /// Entity de pago 
    var dataPayment: DataMakePayment = DataMakePayment()
    /// Cvv de la tarjeta
    var cvvCardForm: String = ""
    /// Nombre de titular
    var nameForm: String = ""
    /// Mes de expiración
    var expMonthCardForm: String = ""
    /// Año de expiración
    var expYearCardForm: String = ""
    /// Formulario de número de tarjeta
    var cardNumberForm: String = ""
    /// Id de usuario registrado
    var customerId: Int = 0
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
        if let cvv = txtCVV.text {
            cvvCardForm = cvv
        }
        if let holderName = txtName.text {
            nameForm = holderName
        }
        if let expirationMonth = txtMonth.text{
            expMonthCardForm = expirationMonth
        }
        if let expirationYear = txtYear.text{
            expYearCardForm = expirationYear
        }
        if let cardNumber = txtNumber.text{
            cardNumberForm = cardNumber
        }
        dataPayment.cardNumber = cardNumberForm
        dataPayment.expirationYear = expYearCardForm
        dataPayment.holderName = nameForm
        dataPayment.expirationMonth = expMonthCardForm
        dataPayment.cvv = cvvCardForm
        dataPayment.customerId = customerId
        presenter?.openpay(parametersCreateToken: dataPayment)
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
