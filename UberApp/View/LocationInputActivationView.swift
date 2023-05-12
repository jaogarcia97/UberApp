//
//  LocationInputActivationView.swift
//  UberApp
//
//  Created by Jao Garcia on 3/30/23.
//

import UIKit

//Class Definition: This View is the search bar for finding locations

protocol LocationInputActivationViewDelegate: class {
    func presentLocationInputView()
}

class LocationInputActivationView: UIView {
    
    //MARK: - Properties
    weak var delegate: LocationInputActivationViewDelegate?
    
    //The black bullet in the location search bar
    let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    //Place holder for the search bar
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addShadow()
        
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(height: 6, width: 6)
        
        addSubview(placeholderLabel)
        placeholderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
        
        //Tap input activation view
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowLocationInputView))
        addGestureRecognizer(tap)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc func handleShowLocationInputView(){
        delegate?.presentLocationInputView()
    }
    

}
