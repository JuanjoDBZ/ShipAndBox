//
//  RequestInformationVC.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//  
//

import Foundation
import UIKit
import MapKit
import GooglePlaces
import CoreLocation
class RequestInformationVC: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldNumberIdentification: UITextField!
    @IBOutlet weak var textFieldMobileNumber: UITextField!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    //@IBOutlet weak var searchController: UISearchBar!
    var dataUserRegister: DataUserRegister = DataUserRegister()
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var presenter: RequestInformationPresenterProtocol?
    var locationLatitude: Double = Double()
    var locationLongitude: Double =  Double()
    /// Inicio de ciclo de vida de la app.
    override func viewDidLoad() {
        super.viewDidLoad()
        //Opcional
        setupSearchController()
        //presenter?.getInitialInfo()
    }
    @IBAction func actionContinue(_ sender: UIButton) {
        if let names = textFieldName.text, let email = textFieldEmail.text, let password = textFieldPassword.text,
           let repeatPassword  = textFieldConfirmPassword.text, let lastName = textFieldLastName.text,
           let idNumberIne = textFieldNumberIdentification.text, let cellPhone = textFieldMobileNumber.text, let phoneNumber = textFieldPhoneNumber.text {
            let render = UIGraphicsImageRenderer(size: self.mapView.bounds.size)
            let image = render.image { ctx in
              self.mapView.drawHierarchy(in: self.mapView.bounds, afterScreenUpdates: true)
            }
            if let imageBase64 = image.jpegData(compressionQuality: 0.8)?.base64EncodedString() {
                let imageBase = "data:image/jpeg;base64,\(imageBase64)"
                dataUserRegister.proofAddress = imageBase
            }
            dataUserRegister.names = names
            dataUserRegister.surnames = lastName
            dataUserRegister.email = email
            dataUserRegister.password = password
            dataUserRegister.repeatPassword = repeatPassword
            dataUserRegister.idNumberIne = idNumberIne
            dataUserRegister.cellPhone = cellPhone
            dataUserRegister.phone = phoneNumber
            if validationsRegisterNewUser.validate.validateFormRegister(Controller: self, email: textFieldEmail, password: textFieldPassword, passwordConfirm: textFieldConfirmPassword, name: textFieldName, surname: textFieldLastName, identificationNumber: textFieldNumberIdentification, mobile: textFieldMobileNumber, phone: textFieldPhoneNumber) {
                self.view.activityStartAnimating(activityColor: UIColor.green, backgroundColor: UIColor.black.withAlphaComponent(0.5))
                presenter?.createNewUserView(data: dataUserRegister)
            }
        }
    }
    func setupSearchController() {
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
    }
}
///Protocolo para recibir datos de presenter.
extension RequestInformationVC: RequestInformationViewProtocol {
    func sendSuccesResponseToView(customerId: Int) {
        DispatchQueue.main.async {
            self.presenter?.goToStepThreeRegister(customerId: customerId)
            self.view.activityStopAnimating()
        }
    }
    func sendErrorResponseToView(msgError: String) {
        DispatchQueue.main.async {
            self.view.activityStopAnimating()
            UtilitiesSAB.api.showMessageError(msg: msgError, controller: self)
        }
    }
    func loadInfo(){
        print("Solicitar informacion")
    }
}
///Extension para googleMaps
extension RequestInformationVC: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        self.locationLatitude = place.coordinate.latitude
        self.locationLongitude = place.coordinate.longitude
        let location = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        location.geocode { placemark, error in
            if let error = error as? CLError {
                print("CLError:", error)
                return
            } else if let placemark = placemark?.first {
                if let addres = placemark.name, let zipCode = placemark.postalCode,
                   let subUrb = placemark.subLocality, let city = placemark.subAdministrativeArea,
                   let state = placemark.administrativeArea, let country = placemark.country {
                    self.dataUserRegister.address = addres
                    self.dataUserRegister.zipCode = zipCode
                    self.dataUserRegister.suburb = subUrb
                    self.dataUserRegister.city = city
                    self.dataUserRegister.state = state
                    self.dataUserRegister.country = country
                    self.dataUserRegister.longitude = String(self.locationLongitude)
                    self.dataUserRegister.latitude = String(self.locationLatitude)
                }
            }
        }
        searchController?.isActive = false
        mapView.removeAnnotations(mapView.annotations)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: place.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = place.coordinate
        annotation.title = place.name
        annotation.subtitle = place.formattedAddress
        mapView.addAnnotation(annotation)
    }
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
extension CLLocation {
    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void)  {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}
