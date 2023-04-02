//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Gabriel Maldonado Almendra on 2/4/23.
//

import XCTest

class RemoteFeedLoader {

    func load() {
        HTTPClient.shared.requestedURL = URL(string: "foo")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    var requestedURL: URL?
    
    private init() {}
}

final class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
