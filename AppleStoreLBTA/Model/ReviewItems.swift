//
//  ReviewItems.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 6.01.2024.
//

import Foundation


struct Reviews: Decodable {
    
    let feed: ReviewFeed
}


struct ReviewFeed: Decodable {
    
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: AuthorReview
    let title: Label
    let content: Label
}

struct AuthorReview: Decodable {
    let name: Label
}


struct Label: Decodable {
    let label: String
}










