//
//  APIError.swift
//  PostCodableRequest
//
//  Created by James Rochabrun on 10/19/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

enum APIError: Error {
    
    case invalidData
    case jsonDecodingFailure
    case responseUnsuccessful(description: String)
    case decodingTaskFailure(description: String)
    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case postParametersDecodingFalure(description: String)
    
    var customDescription: String {
        switch self {
        case .requestFailed(let description): return "YMCAPIError - Request Failed -> \(description)"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful(let description): return "YMCAPIError - Response Unsuccessful status code -> \(description)"
        case .jsonDecodingFailure: return "YMCAPIError - JSON decoding Failure"
        case .jsonConversionFailure(let description): return "YMCAPIError - JSON Conversion Failure -> \(description)"
        case .decodingTaskFailure(let description): return "YMCAPIError - decodingtask failure with error -> \(description)"
        case .postParametersDecodingFalure(let description): return "APIError - post parameters failure -> \(description)"
        }
    }
}
