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
    var statusResponse = 0
    let customerId = 2
    @IBOutlet weak var viewSignatureUser: YPDrawSignatureView!
    @IBOutlet weak var activitySAB: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSignatureUser.delegate = self
        viewSignatureUser.layer.borderWidth = 1
        viewSignatureUser.layer.borderColor = UIColor.gray.cgColor
        activitySAB.hidesWhenStopped = true
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
            let imageBase64StringSignatureUser = imageDataSignature?.base64EncodedString()
            presenter?.sendSignatureUserSAB(imageStringSignatureUser:imageBase64StringSignatureUser!,customerId:customerId)
        }else{
            self.showMessage(msg:"Tienes que firmar en el recuadro")
        }
        
    }
    
    func showMessage(msg:String) {
        let alert = UIAlertController(title: "Aviso", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            self.goToUserRegisterStepFour()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToUserRegisterStepFour(){
        if(self.statusResponse == 1) {
            self.statusResponse = 0
            presenter?.goToUserRegisterStepFour()
        }else{
            print("error")
        }
    }
    func didStart(_ view : YPDrawSignatureView) {
        //print("Started Drawing")
    }
    // didFinish() is called rigth after the last touch of a gesture is registered in the view.
    // Can be used to enabe scrolling in a scroll view if it has previous been disabled.
    func didFinish(_ view : YPDrawSignatureView) {
        //print("Finished Drawing")
    }
}
///Protocolo para recibir datos de presenter.
extension SABUserRegisterStepThreeVC: SABUserRegisterStepThreeViewProtocol {
    func showActivity() {
        DispatchQueue.main.async {
            self.activitySAB.startAnimating()
        }
    }
    
    func hideActivity() {
        DispatchQueue.main.async {
            self.activitySAB.stopAnimating()
            self.activitySAB.hidesWhenStopped = true
        }
    }
    
    func getDataInViewSAB(status:Int,msg:String) {
        DispatchQueue.main.async {
            self.statusResponse = status
            self.showMessage(msg:msg)
            self.viewSignatureUser.clear()
        }
    }
    
}
