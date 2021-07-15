//
//  validationsRegisterNewUser.swift
//  ShipAndBox
//
//  Created by ISITA on 15/07/21.
//

import Foundation
import UIKit
class validationsRegisterNewUser {
    static let validate = validationsRegisterNewUser()
    /// Validar campos vacios en formulario de registro de usuario
    /// - Parameters:
    ///   - Controller: vista donde se muestra el mensaje
    ///   - email: validar emal
    ///   - password: validar contrseña
    ///   - passwordConfirm: validar confirmar contraseña
    ///   - name: validar nombre
    ///   - surname: validar apellido
    ///   - identificationNumber: vlidar nª de identificación
    ///   - mobile: validar cel
    ///   - phone: validar télefono
    /// - Returns: retorna verdadero si secumplen con las validaciones, si no retorna falso
    func validateFormRegister(Controller:UIViewController,email: UITextField, password: UITextField, passwordConfirm: UITextField, name: UITextField, surname: UITextField, identificationNumber: UITextField, mobile: UITextField, phone: UITextField) -> Bool {
        //validar correo vacío
        if email.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de correo electrónico no debe estar vacío", controller: Controller)
            return false
        }
        //validar campo de contraseña vacío
        if password.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de contraseña no debe estar vacío", controller: Controller)
            return false
        }
        //validar campo de confirmar contraseña vacío
        if passwordConfirm.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de confirmar contraseña no debe estar vacío", controller: Controller)
            return false
        }
        //validar campo de nombre vacío
        if name.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de Nombre(s) no debe estar vacío", controller: Controller)
            return false
        }
        //validar campo de Apellidos vacío
        if surname.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de Apellidos no debe estar vacío", controller: Controller)
            return false
        }
        //validar campo de Número de identificación vacío
        if identificationNumber.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de Número de identificación no debe estar vacío", controller: Controller)
            return false
        }
        //validar campo de celular vacío
        if mobile.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de celular no debe estar vacío", controller: Controller)
            return false
        }
        //validar campo de confirmar contraseña vacío
        if phone.text == "" {
            UtilitiesSAB.api.showMessageError(msg:"El campo de Télefono no debe estar vacío", controller: Controller)
            return false
        }
        //Contraseñas no coinciden
        if password.text != passwordConfirm.text{
            UtilitiesSAB.api.showMessageError(msg:"Las contraseñas no coinciden", controller: Controller)
            return false
        }
        return true
    }
}
