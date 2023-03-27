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
        button.setTitleColor(UIColor(white: 1, alpha: 0.8), for: .normal)
        button.backgroundColor = .mainBlueTint //Custom Color
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        //Make Mutable Attributed String
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ",
                                                        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        //button.addTarget(self, action: #selector(handleShowSignUp), for: (.touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor //Custom App BG Color
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
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor, height:32)
        dontHaveAccountButton.centerX(inView: view)
        
    
    }
    
    //Change color of iPhone time and signal to white
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}
