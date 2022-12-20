//
//  RedditListUseCase.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 19/12/22.
//

import Foundation

class RedditListUseCase: UseCase {
    let repository: RedditListRepository

    init(repository: RedditListRepository) {
        self.repository = repository
    }
    
    func fetchList(request: API?, success: @escaping ([RedditListEntity]?) -> Void, error: @escaping (ErrorResponse) -> Void) {
        self.repository.fetchRedditList(request: request) { list in
            success(list)
        } error: { errorMsg in
            error(errorMsg)
        }
    }
}

