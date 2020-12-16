//
//  UIImageView+Ext.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

extension UIImageView {
    
    func setImage(fromURL urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { [weak self] image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
