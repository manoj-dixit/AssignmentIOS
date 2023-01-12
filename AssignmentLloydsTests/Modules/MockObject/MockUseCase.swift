//
//  MockUseCase.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import Foundation
@testable import AssignmentLloyds

final class MockRedditListUseCase: UseCase {
    
    var redditList: [RedditListEntity]?
    var error: Error?
    
    func fetchList(completion: @escaping DomainResponse) {
        if let _ = error {
            completion(.failure(NetworkError.failed))
        } else if let redditList = redditList {
            completion(.success(redditList))
        }
    }
}
