//
//  CoverPhotoImageView.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class CoverPhotoImageView: UIImageView {

    // MARK: - Properties
    
    let cache = NetworkManager.shared.cache
    
    // MARK: - Initializers
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
        
    private func configure() {
        layer.cornerRadius = 5
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
