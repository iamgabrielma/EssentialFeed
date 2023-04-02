//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Gabriel Maldonado Almendra on 2/4/23.
//

import XCTest

class RemoteFeedLoader {

    func load(client: HTTPCLient) {
        client.requestedURL = URL(string: "foo")
    }
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

    func test_load_requestDataFromURL() {
        let client = HTTPCLient()
        let sut = RemoteFeedLoader()
        
        sut.load(client: client)
        
        XCTAssertNotNil(client.requestedURL)
    }
}
