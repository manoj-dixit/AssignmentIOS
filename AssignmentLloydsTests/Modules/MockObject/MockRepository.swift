//
//  MockRepository.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import Foundation
@testable import AssignmentLloyds

final class MockRedditListRepository: RedditListRepository {
    
    var redditList: RedditListResponse?
    var error: Error?

    func fetchRedditList(completion: @escaping DataResponse) {
        if let _ = error {
            completion(.failure(NetworkError.failed))
        } else if let redditList = redditList {
            completion(.success(redditList))
        }
    }
}
