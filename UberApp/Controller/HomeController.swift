//
//  HomeController.swift
//  UberApp
//
//  Created by Jao Garcia on 3/29/23.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    
    //MARK: - Properties
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private let inputActivationView = LocationInputActivationView()
    private let locationInputView = LocationInputView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        enableLocationServices()
        //signOut()
        //view.backgroundColor = .red
    }
    
    //MARK: - API
    func checkIfUserIsLoggedIn() {
        //Check if user is logged in:
        if Auth.auth().currentUser?.uid == nil{
            print("DEBUG: User not logged in.. ")
            //Change View Controller; Reminder to do it on the main thread
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            print("DEBUG: User is logged in.. ")
            print("DEBUG: User id is \(Auth.auth().currentUser?.uid) ")
            configureUI()
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error Signing Out")
        }   
    }
    
    //MARK: - Helper Functions
    func configureUI(){
        configureMapView()
        
        view.addSubview(inputActivationView)
        inputActivationView.centerX(inView: view)
        inputActivationView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationView.layer.cornerRadius = 20
        inputActivationView.anchor(top: view.topAnchor, paddingTop: 50)
        inputActivationView.alpha = 0 //Initial is zero opacity
        
        //For Search Screen results:
        inputActivationView.delegate = self
        
        UIView.animate(withDuration: 2){
            self.inputActivationView.alpha = 1 //Make the activation view visible
        }
    }
    
    func configureMapView(){
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    func configureLocationInputView(){
        view.addSubview(locationInputView)
        locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor,right: view.rightAnchor,height:200)
        locationInputView.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.locationInputView.alpha = 1
        }) { _ in
            print("Debug: Present Table View..")
        }
        
    }
    

}

//MARK: - LocationServices
extension HomeController: CLLocationManagerDelegate {
    
    func enableLocationServices(){
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus(){
        case .notDetermined:
            print("DEBUG: Not determined")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break //Not really needed
        case .denied:
            break //Not really needed
        case .authorizedAlways:
            print("DEBUG: Auth Always..")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest //Best Location Accuracy
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break //Not really needed
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //Immediately prompt them the Auth Always, after the choosing the option "allow while using"
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
}

extension HomeController:LocationInputActivationViewDelegate {
    //When you click on the search bar this will happen"
    func presentLocationInputView() {
        print("DEBUG: Handle present location input view.. ")
        configureLocationInputView()
    }
}
