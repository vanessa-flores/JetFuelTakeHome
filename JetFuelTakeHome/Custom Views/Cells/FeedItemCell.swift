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
    var feedItem: FeedItem?
    
    // MARK: - Views
    
    let feedItemHeader = FeedItemHeaderView(frame: .zero)
    var collectionView: UICollectionView!
    
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
        configureCollectionView()
    }
    
    private func configureHeader() {
        addSubview(feedItemHeader)
        feedItemHeader.translatesAutoresizingMaskIntoConstraints = false
        
        feedItemHeader.backgroundColor = .systemPink
                
        NSLayoutConstraint.activate([
            feedItemHeader.topAnchor.constraint(equalTo: self.topAnchor),
            feedItemHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            feedItemHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            feedItemHeader.heightAnchor.constraint(equalToConstant: 102)
        ])
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MediaPreviewCell.self, forCellWithReuseIdentifier: MediaPreviewCell.reuseId)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: feedItemHeader.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    // MARK: - Helpers
    
    func set(feedItem: FeedItem) {
        feedItemHeader.setFeedItem(feedItem)
        self.feedItem = feedItem
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension FeedItemCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaPreviewCell.reuseId, for: indexPath) as! MediaPreviewCell
        
        if let currentFeedItem = feedItem {
            let mediaItem = currentFeedItem.mediaObjects[indexPath.row]
            cell.set(mediaItem)
        }
        
        return cell
    }
    
    
}
