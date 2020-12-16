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
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout(in: self))
        collectionView.backgroundColor = .systemGray6
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
    
    private func createCollectionViewLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let padding: CGFloat = 16
        let itemHeight: CGFloat = 260
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: 100, height: itemHeight)
        
        return flowLayout
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
        return feedItem?.mediaObjects.count ?? 0
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
