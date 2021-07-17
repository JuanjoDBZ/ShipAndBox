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
class RequestInformationVC: UIViewController, CLLocationManagerDelegate {
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
    var locationManager:CLLocationManager!
    /// Parar la geolicalización
    private var didPerformGeocode = false
    /// Inicio de ciclo de vida de la app.
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        textFieldName.text = dataUserRegister.names
        textFieldLastName.text = dataUserRegister.surnames
        textFieldNumberIdentification.text = dataUserRegister.idNumberIne
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
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
    
    //MARK: - location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first, location.horizontalAccuracy >= 0 else { return }
        guard !didPerformGeocode else { return }
        didPerformGeocode = true
        locationManager.stopUpdatingLocation()
        let pLat = location.coordinate.latitude
        let pLong = location.coordinate.longitude
        let center = CLLocationCoordinate2D(latitude: pLat, longitude: pLong)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        let addAnotation = MKPointAnnotation()
        addAnotation.title = "Mi ubicación"
        addAnotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        self.mapView.addAnnotation(addAnotation)
        self.mapView.setRegion(region, animated: true)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                if let addres = placemark.name, let zipCode = placemark.postalCode,
                   let subUrb = placemark.subLocality, let city = placemark.subAdministrativeArea,
                   let state = placemark.administrativeArea, let country = placemark.country {
                    self.dataUserRegister.address = addres
                    self.dataUserRegister.zipCode = zipCode
                    self.dataUserRegister.suburb = subUrb
                    self.dataUserRegister.city = city
                    self.dataUserRegister.state = state
                    self.dataUserRegister.country = country
                    self.dataUserRegister.longitude = String(location.coordinate.longitude)
                    self.dataUserRegister.latitude = String(location.coordinate.latitude)
                }
            }
        }
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            let placemark = placemarks?.first
            guard error == nil && placemark != nil else {
                return
            }
            if let addres = placemark?.name, let zipCode = placemark?.postalCode,
               let subUrb = placemark?.subLocality, let city = placemark?.subAdministrativeArea,
               let state = placemark?.administrativeArea, let country = placemark?.country {
                self.dataUserRegister.address = addres
                self.dataUserRegister.zipCode = zipCode
                self.dataUserRegister.suburb = subUrb
                self.dataUserRegister.city = city
                self.dataUserRegister.state = state
                self.dataUserRegister.country = country
                self.dataUserRegister.longitude = String(location.coordinate.longitude)
                self.dataUserRegister.latitude = String(location.coordinate.latitude)
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
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
