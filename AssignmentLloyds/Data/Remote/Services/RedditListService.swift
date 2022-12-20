//
//  StargazersList.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation

struct RedditListRemoteService: RedditListDataSource {
    
    func fetchRedditList(request: API?, completion: @escaping (RedditListResponse) -> Void, error: @escaping (ErrorResponse) -> Void) {
        NetworkService.fetch(name: request) { result, response, errorMsg in
            if let data = result {
                if let model = try? JSONDecoder().decode(RedditListResponse.self, from: data) {
                    completion(model)
                } else {
                    error(ErrorResponse(message: "Parsing failed"))
                }
            } else {
                error(ErrorResponse(message: errorMsg?.message ?? ""))
            }
        }
    }
}
