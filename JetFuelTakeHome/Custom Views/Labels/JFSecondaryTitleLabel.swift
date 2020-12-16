//
//  JFSecondaryTitleLabel.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class JFSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    convenience init() {
        self.init(frame: .zero)
    }
        
    private func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
