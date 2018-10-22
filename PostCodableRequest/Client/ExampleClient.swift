//
//  ExampleClient.swift
//  PostCodableRequest
//
//  Created by James Rochabrun on 10/19/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

// Dummy example
class NarcosClient: GenericAPIClient {
    
    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    /// Fetch Narcs Characters by name
    func fetchNarcs(id: String, completion: @escaping (Result<Narc?, APIError>) -> ()) {
        
        let parameter = NarcParameter(id: id)
        guard let request = NarcosFeed.narcs.postRequest(parameters: parameter,
                                                                     headers: [HTTPHeader.contentType("application/json")]) else { return }

        fetch(with: request , decode: { json -> Narc? in
            guard let results = json as? Narc else { return  nil }
            return results
        }, completion: completion)
    }
}

// MODEL THAT WILL RETURN FROM REQUEST
struct Narc: Decodable {
    let name: String
}

/// MODEL PARAMETER REQUESTED FOR THE API
struct NarcParameter: Encodable {
    let id: String
}

/// ENDPOINT CONFORMANCE
enum NarcosFeed {
    case narcs
    case police
}

extension NarcosFeed: Endpoint {
    
    var base: String {
        return "https://api.narcos.org"
    }
    
    var path: String {
        switch self {
        case .narcs: return "/3/narcs"
        case .police: return "/3/police"
        }
    }
}
