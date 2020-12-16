//
//  JFImageView.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class JFImageView: UIImageView {

    // MARK: - Properties
    
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
        layer.cornerRadius = 20
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Helpers
        
    func setImage(fromURL urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { [weak self] image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }

}
