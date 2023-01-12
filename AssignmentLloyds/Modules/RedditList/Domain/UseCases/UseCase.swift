//
//  UseCase.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 19/12/22.
//

import Foundation

typealias DomainResponse = (Result<[RedditListEntity], Error>) -> Void

protocol UseCase {
    func fetchList(completion: @escaping DomainResponse)
}
