//
//  Endpoint.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation


protocol APIEndPointInterface {
    var url: URL { get }
    var method: HTTPMethodType { get }
}

enum HTTPMethodType: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

struct Endpoint: APIEndPointInterface {
    var url: URL
    var method: HTTPMethodType
    
    init(url: URL,
         method: HTTPMethodType) {
        self.url = url
        self.method = method
    }
}
