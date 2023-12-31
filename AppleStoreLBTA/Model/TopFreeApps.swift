//
//  Apps.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 31.12.2023.
//

import Foundation


struct TopFreeApps: Codable {
    
    let feed: Feed
}

struct Feed: Codable {
    
    let title: String
    let results: [AppResults]
}


struct AppResults: Codable {
    
    let name: String?
    let artistName: String?
    let id: String?
    let artworkUrl100: String?
}

