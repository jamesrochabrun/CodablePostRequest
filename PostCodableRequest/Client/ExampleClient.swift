//
//  ExampleClient.swift
//  PostCodableRequest
//
//  Created by James Rochabrun on 10/19/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

class ExampleClient: GenericAPIClient {
    
    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
//    func getReplies(from message: String, completion: @escaping (Result<YMBMLSmartReplyResult?, YMCAPIError>) -> ()) {
//
//        let parameter = Parameter(message: message)
//        guard let request = YMBMLReplyEndpoint.autoReply.postRequest(parameters: parameter,
//                                                                     headers: [YMCHTTPHeader.contentType("application/json")]) else { return }
//
//        fetch(with: request , decode: { json -> YMBMLSmartReplyResult? in
//            guard let results = json as? YMBMLSmartReplyResult else { return  nil }
//            return results
//        }, completion: completion)
//    }
}
//
//struct Parameter: Encodable {
//    let message: String
//}

