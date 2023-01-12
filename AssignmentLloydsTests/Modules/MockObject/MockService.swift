//
//  MockService.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import Foundation
@testable import AssignmentLloyds

final class MockRedditListService: RedditListDataSource {

    var response: RedditListResponse?
    var error: Error?
    
    func fetchRedditList(completion: @escaping (Result<RedditListResponse, Error>) -> Void) {
        if let error = error {
            return completion(.failure(error))
        }
        if let response = response {
            return completion(.success(response))
        }
    }
}
