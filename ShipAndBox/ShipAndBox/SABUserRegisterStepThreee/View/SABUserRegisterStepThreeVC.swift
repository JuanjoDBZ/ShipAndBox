//
//  SABUserRegisterStepThreeVC.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//

import Foundation
import UIKit

class SABUserRegisterStepThreeVC: UIViewController, YPSignatureDelegate {

    var presenter: SABUserRegisterStepThreePresenterProtocol?

    @IBOutlet weak var viewSignatureUser: YPDrawSignatureView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSignatureUser.delegate = self
        viewSignatureUser.layer.borderWidth = 1
        viewSignatureUser.layer.borderColor = UIColor.gray.cgColor
        //Opcional
        
    }
    
    @IBAction func clearSignatureUser(_ sender: Any) {
        self.viewSignatureUser.clear()
    }
    
    @IBAction func generateSignatureUserAndSendInfo(_ sender: Any) {
        // Getting the Signature Image from self.drawSignatureView using the method getSignature().
        if self.viewSignatureUser.getSignature(scale: 10) != nil {
            let imageData = self.viewSignatureUser.getSignature(scale: 10)
            let imageDataSignature = imageData?.jpegData(compressionQuality: 1)
            let imageBase64String = imageDataSignature?.base64EncodedString()
            let customerId = 2
            //print(imageBase64String!)
            presenter?.sendSignatureUserSAB(imageString:imageBase64String!,customerId:customerId)
        }
        
    }
    func didStart(_ view : YPDrawSignatureView) {
        print("Started Drawing")
    }
    // didFinish() is called rigth after the last touch of a gesture is registered in the view.
    // Can be used to enabe scrolling in a scroll view if it has previous been disabled.
    func didFinish(_ view : YPDrawSignatureView) {
        print("Finished Drawing")
    }
}
///Protocolo para recibir datos de presenter.
extension SABUserRegisterStepThreeVC: SABUserRegisterStepThreeViewProtocol {
    func loadInfo(){
        print("Realizar acciones de repintado de la vista")
    }
}
