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
        //Set Dimensions of the Container View
        let view = UIView() //Container View
        //view.backgroundColor = .red
        
        //Initialize Mail Image
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        //Set Location of Mail Image in view
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        //Add email textfield inside, must: set let to var (since you are going to use another variable for the value of this variable)
        view.addSubview(emailTextfield)
        emailTextfield.centerY(inView: view)
        emailTextfield.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        //Seperator View (Underline the textfield) 
        let seperatorView = UIView()
        seperatorView.backgroundColor = .lightGray
        view.addSubview(seperatorView)
        seperatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
                             right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
    
        return view
    }()
    
    //EMAIL TEXTFIELD: - Seperate it from the container, because eventually we would have to manipulate the textField alone
    private let emailTextfield: UITextField = {
        let tf = UITextField()
        //Remove Border
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardAppearance = .dark //Dark Keyboard
        //Use Attributes to specify properties, in this case we added .foregroundColor to manipulate the color
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return tf
    }()
    
    
    
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
       
        //Initialize Title label
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
        
        
        //Initialize Email SubView
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16,height: 50)
        
        
    }
    
    //Change color of iPhone time and signal to white
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}
