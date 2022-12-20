//
//  NetworkService.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation

typealias ResultType = Result<Any,Error>
typealias ResultClosure = (ResultType) -> Void

protocol NetworkServiceProtocol {
    static func fetch(name: API?, completion: @escaping (_ result: Data?, _ response: URLResponse?, _ error: ErrorResponse?) -> ())
}

struct NetworkService: NetworkServiceProtocol {
    
    static func fetch(name: API? , completion: @escaping (_ result: Data?, _ response: URLResponse?, _ error: ErrorResponse?) -> ()) {
        
        guard let path = name?.path, let url = URL(string: path) else {
            completion(nil, nil, ErrorResponse(message: "URL Error"))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            if error != nil, let errorMsg = error?.localizedDescription {
                completion(nil, nil, ErrorResponse(message: errorMsg))
            } else {
                completion(data, response, nil)
            }
        }
        task.resume()
    }
}

class AuthenticationDelegate: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
        /// React to challenge and call the completion handler
        if let serverTrust = challenge.protectionSpace.serverTrust {
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
            return
        }
        completionHandler(.cancelAuthenticationChallenge, nil)
        return
    }
}
