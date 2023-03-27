//
//  Extensions.swift
//  UberApp
//
//  Created by Jao Garcia on 3/27/23.
//

import UIKit

extension UIView {
    //Set init values to nil because we are not going to add value to them all the time
    //For width and height, if it is nil, XCode will automatically determine it.
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0 ,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
        
        //Set Auto Layouts to false because we are going to customize it
        translatesAutoresizingMaskIntoConstraints = false
        
        //Coordinate system of Apple: +Y is downwards, and +X is rightwards
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        //Negative value for bottom because you want to go inside the the outer layer, in order to go inside, you need to go upwards (which is negaative)
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    
    }
    
    
    func centerX(inView view:UIView){
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView){
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    func inputContainerView(image:UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        
        //Initialize Mail Image
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        //Set Location of Mail Image in view
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        
        //Add email textfield inside, must: set let to var (since you are going to use another variable for the value of this variable)
        view.addSubview(textField)
        textField.centerY(inView: view)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        

        //Seperator View (Underline the textfield)
        let seperatorView = UIView()
        seperatorView.backgroundColor = .lightGray
        view.addSubview(seperatorView)
        seperatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
                             right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
        
    }
    
    
    
}



extension UITextField {
    
    func textField(withPlaceHolder placeholder: String, isSecureTextEntry: Bool) -> UITextField {
        let tf = UITextField()
        //Remove Border
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardAppearance = .dark //Dark Keyboard
        tf.isSecureTextEntry = isSecureTextEntry
        //Use Attributes to specify properties, in this case we added .foregroundColor to manipulate the color
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return tf
    }
    
}
