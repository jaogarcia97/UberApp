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
    
    
}
