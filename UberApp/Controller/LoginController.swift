//
//  LoginController.swift
//  UberApp
//
//  Created by Jao Garcia on 3/27/23.
//

import UIKit

class LoginController:UIViewController {
    
    //MARK: - Set Properties
    
    //UBER TITLE
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    //EMAIL Container:
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextfield)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
        
    }()

    //EMAIL TEXTFIELD: - Seperate it from the container, because eventually we would have to manipulate the textField alone
    private let emailTextfield: UITextField = {
        return UITextField().textField(withPlaceHolder: "Email", isSecureTextEntry: false)
    }()

    //PASSWORD Container
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let passwordTextField:UITextField = {
        return UITextField().textField(withPlaceHolder: "Password", isSecureTextEntry: true)
    }()
    
    
    private let loginUIButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = .blue
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
       
        //Initialize Title label
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginUIButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 40, paddingLeft: 16,paddingRight: 16)
        
        //Initialize Email SubView
//        view.addSubview(emailContainerView)
//        emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16,height: 50)
//        //Initialize Password Subview
//        view.addSubview(passwordContainerView)
//        passwordContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16,height: 50)
        
    
    }
    
    //Change color of iPhone time and signal to white
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}
