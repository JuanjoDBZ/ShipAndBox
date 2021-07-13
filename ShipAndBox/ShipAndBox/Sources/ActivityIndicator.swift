//
//  ActivityIndicator.swift
//  ShipAndBox
//
//  Created by ISITA on 12/07/21.
//
import Foundation
import UIKit
extension UIView{
    
    /// Función para iniciar activity indicator
    /// - Parameters:
    ///   - activityColor: color del activity indicator
    ///   - backgroundColor: color de la vista
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        backgroundView.addSubview(activityIndicator)
        self.addSubview(backgroundView)
    }
    /// Función para detener el activity indicator
    func activityStopAnimating() {
        if let background = viewWithTag(475647) {
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
