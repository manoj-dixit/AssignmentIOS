//
//  StargazerList.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation

// MARK: - Reddit list Model
struct RedditListResponse: Decodable {
    
    let data: RedditData?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    // The Initializer function from Decodable
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(RedditData.self, forKey: .data)
    }
}

// MARK: - WelcomeData
struct RedditData: Decodable {
    
    let after: String?
    let children: [Child]?
    
    enum CodingKeys: String, CodingKey {
        case after
        case children
    }
    
    // The Initializer function from Decodable
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        after = try values.decodeIfPresent(String.self, forKey: .after)
        children = try values.decodeIfPresent([Child].self, forKey: .children)
    }
}

// MARK: - Child
struct Child: Decodable {
    
    let data: ChildData?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    // The Initializer function from Decodable
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ChildData.self, forKey: .data)
    }
}

struct ChildData: Decodable {
    
    let title: String?
    let authorName: String?
    let thumbnailHeight: Int?
    let thumbnailWidth: Int?
    let score: Int?
    let thumbnail: String?
    let totalAwardsReceived: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case score
        case thumbnail
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
        case authorName = "author_fullname"
        case totalAwardsReceived = "total_awards_received"
    }
    
    // The Initializer function from Decodable
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        score = try values.decodeIfPresent(Int.self, forKey: .score)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        thumbnailHeight = try values.decodeIfPresent(Int.self, forKey: .thumbnailHeight)
        thumbnailWidth = try values.decodeIfPresent(Int.self, forKey: .thumbnailWidth)
        authorName = try values.decodeIfPresent(String.self, forKey: .authorName)
        totalAwardsReceived = try values.decodeIfPresent(Int.self, forKey: .totalAwardsReceived)
    }
}
