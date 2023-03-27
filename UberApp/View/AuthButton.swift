//
//  AuthButton.swift
//  UberApp
//
//  Created by Jao Garcia on 3/27/23.
//

import UIKit

class AuthButton: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        setTitleColor(UIColor(white: 1, alpha: 0.8), for: .normal)
        backgroundColor = .mainBlueTint //Custom Color
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
