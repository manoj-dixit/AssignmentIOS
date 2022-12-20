//
//  RedditListRepository.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 16/12/22.
//

import Foundation

protocol RedditListRepository {
    
    func fetchRedditList(request: API?, completion: @escaping ([RedditListEntity]?) -> Void, error: @escaping (ErrorResponse) -> Void)

}
