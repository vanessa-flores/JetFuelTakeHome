//
//  JFButton.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/16/20.
//

import UIKit

class JFButton: UIButton {
    
    // MARK: - Initializers
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage, roundedCorners: CACornerMask) {
        self.init(frame: .zero)
        set(image: image, roundedCorners: roundedCorners)
    }
    
    private func set(image: UIImage, roundedCorners: CACornerMask) {
        self.setImage(image, for: .normal)
        self.layer.maskedCorners = roundedCorners
    }
        
    // MARK: - UI Configuration
        
    private func configure() {
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.systemBackground.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    // MARK: - Actions
    
    func setAction(action: UIAction) {
        self.addAction(action, for: .touchUpInside)
    }

}
