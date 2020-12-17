//
//  FeedViewController.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Views
    
    var tableView = UITableView()
    
    // MARK: - Properties
    
    var feedItems: [FeedItem] = []
    var storedOffsets: [Int: CGFloat] = [:]
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureNavigationBar()
        configureTableView()
        loadFeedItems()
    }
    
    // MARK: - Network Call

    private func loadFeedItems() {
        NetworkManager.shared.getFeed { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let feedItems):
                self.updateUI(with: feedItems)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - UI Configuration
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationItem.title = "PLUGS"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
                
        tableView.frame = view.bounds
        tableView.rowHeight = 411
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FeedItemCell.self, forCellReuseIdentifier: FeedItemCell.reuseId)
    }
    
    // MARK: - Helpers
    
    private func updateUI(with feedItems: [FeedItem]) {
        self.feedItems = feedItems
                
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedItem = feedItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedItemCell.reuseId) as! FeedItemCell
        cell.set(feedItem: feedItem)
        cell.selectionStyle = .none
        cell.contentView.isUserInteractionEnabled = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? FeedItemCell else { return }
        
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        cell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? FeedItemCell else { return }
        
        storedOffsets[indexPath.row] = cell.collectionViewOffset
    }
    
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedItems[collectionView.tag].mediaObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaPreviewCell.reuseId, for: indexPath) as! MediaPreviewCell
        let mediaItem = feedItems[collectionView.tag].mediaObjects[indexPath.row]
        cell.set(mediaItem)
        cell.contentView.isUserInteractionEnabled = false
        
        return cell
    }
    
    
}
