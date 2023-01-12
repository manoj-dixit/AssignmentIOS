//
//  RedditListRepository.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 16/12/22.
//

import Foundation

typealias DataResponse = (Result<RedditListResponse, Error>) -> Void

protocol RedditListRepository {
    func fetchRedditList(completion: @escaping DataResponse)
}
