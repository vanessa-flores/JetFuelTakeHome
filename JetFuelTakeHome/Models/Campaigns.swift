//
//  Campaigns.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import Foundation

struct Campaign: Codable {
    
    let campaignItems: [FeedItem]
    
    enum CodingKeys: String, CodingKey {
        case campaignItems = "campaigns"
    }
}

struct FeedItem: Codable {
    
    let id: Int?
    let companyName: String?
    var payPerInstall: String?
    var campaignIconUrl: String?
    var mediaObjects: [MediaItem]
    
    enum CodingKeys: String, CodingKey {
        case companyName = "campaign_name"
        case payPerInstall = "pay_per_install"
        case campaignIconUrl = "campaign_icon_url"
        case mediaObjects = "medias"
        
        case id
    }
}

struct MediaItem: Codable {
    
    var coverPhotoUrl: String?
    var downloadUrl: String?
    var trackingLink: String?
    var mediaType: String?
    
    enum CodingKeys: String, CodingKey {
        case coverPhotoUrl = "cover_photo_url"
        case downloadUrl = "download_url"
        case trackingLink = "tracking_link"
        case mediaType = "media_type"
    }
}
