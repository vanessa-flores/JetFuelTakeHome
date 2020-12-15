//
//  NetworkManager.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "http://www.plugco.in/public/"
    
    private init() {}
    
    func getFeed(completion: @escaping (Result<[FeedItem], Error>) -> Void) {
        let endpoint = baseURL + "take_home_sample_feed"
        
        guard let url = URL(string: endpoint) else {
            print("Failed to converto to Url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("There was an error")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                print("Invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let campaigns = try decoder.decode(Campaign.self, from: data)
                let feedItems: [FeedItem] = campaigns.campaignItems
                completion(.success(feedItems))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
}