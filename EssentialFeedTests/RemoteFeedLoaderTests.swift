//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Gabriel Maldonado Almendra on 2/4/23.
//

import XCTest

class RemoteFeedLoader {

    func load() {
        HTTPCLient.shared.requestedURL = URL(string: "foo")
    }
}

class HTTPCLient {
    static let shared = HTTPCLient()
    var requestedURL: URL?
    
    private init() {}
}

final class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPCLient.shared
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPCLient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
