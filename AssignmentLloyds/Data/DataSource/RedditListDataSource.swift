//
//  APIService.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation

protocol RedditListDataSource {
    func fetchRedditList(request: API?, completion: @escaping (RedditListResponse) -> Void, error: @escaping (ErrorResponse) -> Void)
}
