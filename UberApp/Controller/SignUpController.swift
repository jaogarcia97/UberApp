//
//  SignUpController.swift
//  UberApp
//
//  Created by Jao Garcia on 3/27/23.
//

import UIKit

class SignUpController: UIViewController {
    
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
    
    //Full Name Container
    private lazy var fullnameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullnameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    private let fullnameTextField:UITextField = {
        //Seperate it from the container, because eventually we would have to manipulate the textField alone
        return UITextField().textField(withPlaceHolder: "Full Name", isSecureTextEntry: false)
    }()
    
    //Account Type container
    private lazy var accountTypeContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"),segmentedControl:accountTypeSegmentedControl)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let accountTypeSegmentedControl: UISegmentedControl = {
       let sc = UISegmentedControl(items: ["Rider","Driver"])
        sc.backgroundColor = .backgroundColor
        sc.tintColor = UIColor(white: 1, alpha: 0.87) //Alpha is recommended to be 0.87 by the google documentation
        sc.selectedSegmentIndex = 0 //Index where the the selection defaults to
        return sc
    }()
    
    //SignUp Button
    private let signUpButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    //Already Have an Account Button
    let alreadyHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        //Make Mutable Attributed String
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ",
                                                        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Log in", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
    
        //For story boards, this is like conencting an action/IBaction
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Life cycle  
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helper Functions
    func configureUI(){
        view.backgroundColor = .backgroundColor //Custom App BG Color
        //Initialize Title label
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   fullnameContainerView,
                                                   accountTypeContainerView,
                                                   signUpButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 40, paddingLeft: 16,paddingRight: 16)
        
        view.addSubview(alreadyHaveAnAccountButton)
        alreadyHaveAnAccountButton.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor, height:32)
        alreadyHaveAnAccountButton.centerX(inView: view)
        
    }
}
