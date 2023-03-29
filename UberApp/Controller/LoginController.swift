//
//  LoginController.swift
//  UberApp
//
//  Created by Jao Garcia on 3/27/23.
//

import UIKit
import Firebase

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
    private let emailTextfield: UITextField = {
        //Seperate it from the container, because eventually we would have to manipulate the textField alone
        return UITextField().textField(withPlaceHolder: "Email", isSecureTextEntry: false)
    }()

    //PASSWORD Container
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    private let passwordTextField:UITextField = {
        //Seperate it from the container, because eventually we would have to manipulate the textField alone
        return UITextField().textField(withPlaceHolder: "Password", isSecureTextEntry: true)
    }()
    
    //Login Button
    private let loginUIButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for:.touchUpInside)
        return button
    }()
    

    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        //Make Mutable Attributed String
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ",
                                                        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
    
        //For story boards, this is like conencting an action/IBaction
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        configureUI()
    }

    //MARK: - Selectors
    @objc func handleShowSignUp(){
        print("Attempt to push controller")
        
        //In order to perform segue, the root view controller must be UINavigationController(rootViewController: LoginController())
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleLogin() {
        guard let email = emailTextfield.text else {return}
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to log user in with error \(error.localizedDescription)")
                return
            }
            //Dismiss controller if successful login
            print("Successfully logged user in")
            self.dismiss(animated: true, completion: nil) //This Takes you back the the root screen 
        }
    }
    

    //MARK: - Helper Functions
    func configureUI(){
        configureNavigationBar()
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
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor, height:32)
        dontHaveAccountButton.centerX(inView: view)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    
}
