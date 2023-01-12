//
//  StargazerListRepositoryImpl.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 19/12/22.
//

import Foundation

final class RedditListRepositoryImpl: RedditListRepository {
    
    private let remoteDateSource: RedditListDataSource
    init(remote: RedditListDataSource) {
        self.remoteDateSource = remote
    }
    
    func fetchRedditList(completion: @escaping DataResponse) {
        self.remoteDateSource.fetchRedditList { (result: Result<RedditListResponse, Error>) in
            switch result {
            case .success(let list):
                completion(.success(list))
            case .failure(_):
                completion(.failure(NetworkError.failed))
            }
        }
    }   
}
