//
//  StargazersList.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation

struct RedditListRemoteService: RedditListDataSource {
    
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchRedditList(completion: @escaping (Result<RedditListResponse, Error>) -> Void) {
        self.networkManager.request(fromUrl: Configuration.redditListUrl, completion: completion)
    }
}
