//
//  StargazerListRepositoryImpl.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 19/12/22.
//

import Foundation

class RedditListRepositoryImpl: RedditListRepository {
    
    private let remoteDateSource: RedditListRemoteService
    init(remote: RedditListRemoteService) {
        self.remoteDateSource = remote
    }
    
    func fetchRedditList(request: API?, completion: @escaping ([RedditListEntity]?) -> Void, error: @escaping (ErrorResponse) -> Void) {
        
        self.remoteDateSource.fetchRedditList(request: request) { result in
            completion(RedditListMapper().mappedModels(inputModels: result))
        } error: { errorMsg in
            error(errorMsg)
        }
    }    
}
