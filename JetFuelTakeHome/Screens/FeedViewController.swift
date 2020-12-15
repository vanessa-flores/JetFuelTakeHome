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
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = .systemBackground
//        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "PLUGS"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
                
        tableView.frame = view.bounds
        tableView.rowHeight = 82
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
        
        return cell
    }
    
    
}
