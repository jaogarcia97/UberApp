//
//  LoginController.swift
//  UberApp
//
//  Created by Jao Garcia on 3/27/23.
//

import UIKit

class LoginController:UIViewController {
    
    //MARK: - Set Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        //Initialize Label
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        
        //20230327.Jao.Remove.Start: - Moved UI functions to Extensions.Swift
        //Something you have to do to activate automatic layout
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        //Center in the x axis
//        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        //Anchor it to the top of our view, constant is how far it is from the reference
//        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        //20230327.Jao.Remove.End: - Moved UI functions to Extensions.Swift
        
    }
    
    //Change color of iPhone time and signal to white
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}
