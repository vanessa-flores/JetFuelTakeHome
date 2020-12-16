//
//  FeedItemHeaderView.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class FeedItemHeaderView: UIView {

    // MARK: - Properties
    
    let imageView = JFImageView(frame: .zero)
    let titleLabel = JFTitleLabel(fontSize: 22)
    let secondaryLabel = JFSecondaryTitleLabel(fontSize: 17, textColor: .systemGreen)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure UI
    
    private func configure() {
        configureImageView()
        configureTitleLabel()
        configureSecondaryLabel()
    }
    
    private func configureImageView() {
        addSubview(imageView)
        
        let size: CGFloat = 70
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
            imageView.heightAnchor.constraint(equalToConstant: size),
            imageView.widthAnchor.constraint(equalToConstant: size)
        ])
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func configureSecondaryLabel() {
        addSubview(secondaryLabel)
        
        NSLayoutConstraint.activate([
            secondaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            secondaryLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            secondaryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 19),
        ])
    }
    
    // MARK: - Helpers
    
    func setFeedItem(_ feedItem: FeedItem) {
        imageView.setImage(fromURL: feedItem.campaignIconUrl ?? "")
        titleLabel.text = feedItem.companyName
        secondaryLabel.text = feedItem.payPerInstall
    }
    
}
