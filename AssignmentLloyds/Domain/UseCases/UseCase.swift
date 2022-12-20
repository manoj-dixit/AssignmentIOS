//
//  UseCase.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 19/12/22.
//

import Foundation

protocol UseCase {
    func fetchList(request: API?, success: @escaping ([RedditListEntity]?) -> Void, error: @escaping (ErrorResponse) -> Void)
}
