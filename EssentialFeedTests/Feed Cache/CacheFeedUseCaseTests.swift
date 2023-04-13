//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Gabriel Maldonado Almendra on 13/4/23.
//

import XCTest

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class LocalFeedLoader {
    
    init(store: FeedStore) {}
}

class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
