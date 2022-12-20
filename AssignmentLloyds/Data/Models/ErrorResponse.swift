//
//  ErrorResponse.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation

///will Hold the error response with suitable message
struct ErrorResponse: Encodable, Error {

    let message: String
    
    init(message: String) {
        self.message = message
    }
}
