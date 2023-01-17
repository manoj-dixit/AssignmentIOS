//
//  RedditDetailsViewModel.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 11/01/23.
//

import Foundation


typealias DetailsData = (imagePath: String?, authorName: String?, title: String?)

protocol RedditDetailsOutputViewModel {
    func getRedditData() -> DetailsData
}

protocol RedditDetailsViewModelType: RedditDetailsOutputViewModel {
    var output: RedditDetailsOutputViewModel { get }
}

final class RedditDetailsViewModel: RedditDetailsViewModelType {
    
    var output: RedditDetailsOutputViewModel { return self }
    private var redditDetails: RedditListEntity
    
    init(redditDetails: RedditListEntity ) {
        self.redditDetails = redditDetails
    }
    
    func getRedditData() -> DetailsData {
        return (redditDetails.imageUrl, redditDetails.title, redditDetails.authorName)
    }
}

