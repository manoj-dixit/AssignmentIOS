//
//  NetworkError.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/1/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case failed
    case noData
    case noResponse
    case unableToDecode
    
    var description: String {
        switch self {
        case .badRequest: return "Bad Request"
        case .failed: return "Network Request Failed"
        case .noData: return "Response returned with no data"
        case .noResponse: return "Response returned with no response"
        case .unableToDecode: return "Response could not be decoded"
        }
    }
}
