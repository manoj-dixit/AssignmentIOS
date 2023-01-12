//
//  RedditDetailsViewModel.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 11/01/23.
//

import Foundation


typealias DetailsData = (imagePath: String?, authorName: String?, title: String?)
 
protocol RedditDetailsInputViewModel {}

protocol RedditDetailsOutputViewModel {
    func getRedditData() -> DetailsData
}

protocol RedditDetailsViewModelType: RedditDetailsInputViewModel, RedditDetailsOutputViewModel {
    var input: RedditDetailsInputViewModel { get }
    var output: RedditDetailsOutputViewModel { get }
}

final class RedditDetailsViewModel: RedditDetailsViewModelType {
  
    var input: RedditDetailsInputViewModel { return self }
    var output: RedditDetailsOutputViewModel { return self }
    
    private var redditDetails: RedditListEntity
    
    init(redditDetails: RedditListEntity ) {
        self.redditDetails = redditDetails
    }
    
    func getRedditData() -> DetailsData {
        return (redditDetails.imageUrl, redditDetails.title, redditDetails.authorName)
    }
}
 
