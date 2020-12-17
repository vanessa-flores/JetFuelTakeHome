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
    let secondaryLabel = JFSecondaryTitleLabel()
    
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
        
        let imageSize: CGFloat = 70
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),
            imageView.widthAnchor.constraint(equalToConstant: imageSize)
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
        secondaryLabel.attributedText = payPerInstallNSMutableAttributedString(for: feedItem.payPerInstall ?? "")
    }
    
    private func payPerInstallNSMutableAttributedString(for payPerInstall: String) -> NSMutableAttributedString{
        let payPerInstallString = payPerInstall + " per install"
        let attributedString = NSMutableAttributedString(string: payPerInstallString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGreen])
        let range = NSRange(location: 0, length: payPerInstall.count)
        let font = UIFont.systemFont(ofSize: 17, weight: .bold)
        attributedString.addAttribute(.font, value: font, range: range)
        
        return attributedString
    }
    
}
