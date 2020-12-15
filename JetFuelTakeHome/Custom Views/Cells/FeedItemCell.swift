//
//  FeedItemCell.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class FeedItemCell: UITableViewCell {

    // MARK: - Properties
    
    static let reuseId = "FeedItemCell"
    
    // MARK: - Views
    
    let feedItemHeader = FeedItemHeaderView(frame: .zero)
    
    // MARK: - Intializers
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // MARK: - Configuration
        
    private func configure() {
        configureHeader()
    }
    
    private func configureHeader() {
        addSubview(feedItemHeader)
        feedItemHeader.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            feedItemHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            feedItemHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            feedItemHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            feedItemHeader.heightAnchor.constraint(equalToConstant: 82)
        ])
    }
    
    // MARK: - Helpers
    
    func set(feedItem: FeedItem) {
        feedItemHeader.setFeedItem(feedItem)
    }
}
