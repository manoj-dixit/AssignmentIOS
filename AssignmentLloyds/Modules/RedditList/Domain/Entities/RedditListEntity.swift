//
//  RedditListEntity.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation

protocol RedditListEntityProtocol {
    var title: String? { get }
    var imageUrl: String? { get }
    var totalAwardsReceived: Int? { get }
    var authorName: String? { get }
}

struct RedditListEntity: RedditListEntityProtocol {
    var title: String?
    var imageUrl: String?
    var totalAwardsReceived: Int?
    var authorName: String?
}
