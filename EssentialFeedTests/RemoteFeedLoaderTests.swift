//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Gabriel Maldonado Almendra on 2/4/23.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPCLient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPCLient()
        _ = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
    }
}
