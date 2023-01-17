//
//  RedditListUseCase.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 19/12/22.
//

import Foundation

final class RedditListUseCase: UseCase {
    
    let repository: RedditListRepository
    
    init(repository: RedditListRepository) {
        self.repository = repository
    }
    
    func fetchList(completion: @escaping DomainResponse) {
        self.repository.fetchRedditList { (result: Result<RedditListResponse, Error>) in
            switch result {
            case .success(let list):
                completion(.success(RedditListMapper().mappedModels(inputModels: list)))
            case .failure(_):
                completion(.failure(NetworkError.failed))
            }
        }
    }
}

