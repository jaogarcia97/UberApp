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
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        signOut()
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
        view.addSubview(mapView)
        mapView.frame = view.frame
    }

}
