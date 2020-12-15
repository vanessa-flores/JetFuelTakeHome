//
//  FeedViewController.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class FeedViewController: UIViewController {
    
    var feedItems: [FeedItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        
        loadFeedItems()
    }

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
}
