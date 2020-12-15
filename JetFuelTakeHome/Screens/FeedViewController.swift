//
//  FeedViewController.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Properties
    
    var feedItems: [FeedItem] = []
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureNavigationBar()
        
        loadFeedItems()
    }
    
    // MARK: - Network Call

    private func loadFeedItems() {
        NetworkManager.shared.getFeed { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let feedItems):
                self.feedItems = feedItems
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
    
}
