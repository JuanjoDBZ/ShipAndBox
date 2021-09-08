//  PrivacyAndTerms.swift
//  ShipAndBox
//  Created by IsitaFS003 on 19/08/21.
import UIKit
class PrivacyAndTerms: UIView {
    /// Número para dudas.
    @IBOutlet weak var labelNumber: UILabel!
    /// Compras seguras.
    @IBOutlet weak var labelSecurePurchase: UILabel!
    /// Dudas o sugerencia.
    @IBOutlet weak var labelNiggling: UILabel!
    /// Formas de pago.
    @IBOutlet weak var labelWayToPay: UILabel!
    ///Política de Privacidad.
    @IBOutlet weak var labelPrivacy: UILabel!
    /// Inicializadores obligatorios de la clase.
    /// - Parameter aDecoder: Permiten el archivo y la distribución de otros objetos.
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        let _ = loadViewfreamNib()
    }
    /// Función que carga los objetos de la PrivacyAndTerms en la view
    /// - Returns: Regresa la vista PrivacyAndTerms
    func loadViewfreamNib() -> UIView {
        let bundle = Bundle.init(for: type(of: self))
         let nib = UINib(nibName: "PrivacyAndTerms", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
         view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         self.addSubview(view);
        return view
    }
}
