//
//  API.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 16/12/22.
//

import Foundation


// MARK: - API class will help to define the APIs in the remote networking when calling from the server
public class API {
    
    public let path: String
    public let headerParameters: [String: String]
    public let queryParameters: [String: Any]
    public let bodyParameters: [String: Any]
   
    init(path: String,
         headerParameters: [String: String] = [:],
         queryParameters: [String: Any] = [:],
         bodyParameters: [String: Any] = [:]) {
        self.path = path
        self.headerParameters = headerParameters
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
    }
}
