//
//  Model.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 28.12.2023.
//

import UIKit


struct SearchResult: Decodable {
    
    let resultCount: Int?
    let results: [Result]
    
}

struct Result: Decodable {
    
    let trackCensoredName: String?
    let trackName: String?
    let artistName: String?
    let collectionName: String?
    let primaryGenreName: String?
    let averageUserRating: Float?
    let artworkUrl100: String?
    let artworkUrl512: String?
    let formattedPrice: String?
    let releaseNotes: String?
    let screenshotUrls: [String]?
    let trackId: Int?
    
}
