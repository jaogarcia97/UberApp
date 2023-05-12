//
//  LocationInputView.swift
//  UberApp
//
//  Created by Jao Garcia on 3/31/23.
//

import UIKit

// Class Definition: This is when the search bar is tapped, the view expands with a search bar and the street names



class LocationInputView: UIView {
    //MARK: - Properties
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
        return button
    }()
    

    //MARK: - Lifecycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addShadow()
        backgroundColor = .white
        
        addSubview(backButton)
        backButton.anchor(top: topAnchor, left: leftAnchor, paddingTop:
                            44, paddingLeft: 12, width: 12, height: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc func handleBackTapped(){
        print("DEBUG: Handle Back")
    }


}
