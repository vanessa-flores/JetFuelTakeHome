//
//  FeedItemCell.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class FeedItemCell: UITableViewCell {
    
    // MARK: - Views
    
    let feedItemHeader = FeedItemHeaderView(frame: .zero)
    var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    static let reuseId = "FeedItemCell"
    var feedItem: FeedItem?
    
    // MARK: - Computed Properties
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }
        
        set {
            collectionView.contentOffset.x = newValue
        }
    }
    
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
                        
        NSLayoutConstraint.activate([
            feedItemHeader.topAnchor.constraint(equalTo: self.topAnchor),
            feedItemHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            feedItemHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            feedItemHeader.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    private func configureCollectionView() {
        setUpCollectionView()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: feedItemHeader.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func setUpCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout(in: self))
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.systemGray5.cgColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        
        collectionView.register(MediaPreviewCell.self, forCellWithReuseIdentifier: MediaPreviewCell.reuseId)
    }
    
    private func createCollectionViewLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let padding: CGFloat = 20
        let itemWidth: CGFloat = 110
        let itemHeight: CGFloat = 261
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        return flowLayout
    }
    
    // MARK: - Helpers
    
    func set(feedItem: FeedItem) {
        feedItemHeader.setFeedItem(feedItem)
        self.feedItem = feedItem
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    
}
