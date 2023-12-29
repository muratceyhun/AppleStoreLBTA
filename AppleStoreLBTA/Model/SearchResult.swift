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
    let primaryGenreName: String?
    let averageUserRating: Float?
    
}
