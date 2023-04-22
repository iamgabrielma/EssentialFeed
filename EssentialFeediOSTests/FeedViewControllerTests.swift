//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Gabriel Maldonado Almendra on 22/4/23.
//

import XCTest
import EssentialFeed

final class FeedViewController {
    
    init(loader: FeedViewControllerTests.LoaderSpy) {}
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
}

// MARK: - Test Helpers
//
extension FeedViewControllerTests {
    class LoaderSpy {
        private(set) var loadCallCount = 0
    }
}
