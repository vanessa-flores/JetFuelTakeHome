//
//  NetworkManager.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "http://www.plugco.in/public/"
    
    let cache = NSCache<NSString, UIImage>()
    
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
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            print("Invalid image url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data, let image = UIImage(data: data) else {
                print("Error getting image")
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completion(image)
        }
        
        task.resume()
    }
    
    func downloadMedia(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid media url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in            
            guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data, let media = UIImage(data: data) else {
                print("Error getting media")
                return
            }
                        
            completion(media)
        }
        
        task.resume()
    }
}
