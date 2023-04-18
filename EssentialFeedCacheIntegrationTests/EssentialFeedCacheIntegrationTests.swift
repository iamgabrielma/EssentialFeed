//
//  EssentialFeedCacheIntegrationTests.swift
//  EssentialFeedCacheIntegrationTests
//
//  Created by Gabriel Maldonado Almendra on 17/4/23.
//

import XCTest
import EssentialFeed

final class EssentialFeedCacheIntegrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        setupEmptyStoreState()
    }
    
    override func tearDown() {
        super.tearDown()
        
        undoStoreSideEffects()
    }
    
    func test_load_deliversNoItemsOnEmptyCache() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Wait for load completion")
        sut.load { result in
            switch result {
            case let .success(imageFeed):
                XCTAssertEqual(imageFeed, [])
            default:
                XCTFail("Expected empty image feed, got \(result) instead")
            }
        }
        exp.fulfill()
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_load_deliversItemsSavedOnASeparateInstance() {
        let sutInstanceToPerformSave = makeSUT()
        let sutInstanceToPerformLoad = makeSUT()
        let feed = uniqueImageFeed().models
        
        let saveExp = expectation(description: "Wait for save completion")
        sutInstanceToPerformSave.save(feed) { saveError in
            XCTAssertNil(saveError, "Expected to save result successfully, got \(String(describing: saveError)) instead.")
            saveExp.fulfill()
        }
        wait(for: [saveExp], timeout: 1.0)

        let loadExp = expectation(description: "Wait for load completion")
        sutInstanceToPerformLoad.load { loadResult in
            switch loadResult {
            case let .success(imageFeed):
                XCTAssertEqual(imageFeed, feed)
            case let .failure(error):
                XCTFail("Expected feed result, got \(error) instead")
            }
        }
        loadExp.fulfill()
        wait(for: [loadExp], timeout: 1.0)
    }
}

// MARK: - Helpers
//
private extension EssentialFeedCacheIntegrationTests {
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> LocalFeedLoader {
        let storeBundle = Bundle(for: CoreDataFeedStore.self)
        let storeURL = testSpecificStoreURL()
        let store = try! CoreDataFeedStore(storeURL: storeURL, bundle: storeBundle)
        let sut = LocalFeedLoader(store: store, currentDate: Date.init)

        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(store, file: file, line: line)

        return sut
    }
    
    private func setupEmptyStoreState() {
        deleteStoreArtifacts()
    }

    private func undoStoreSideEffects() {
        deleteStoreArtifacts()
    }

    private func deleteStoreArtifacts() {
        try? FileManager.default.removeItem(at: testSpecificStoreURL())
    }
    
    private func testSpecificStoreURL() -> URL {
        return cachesDirectory().appendingPathExtension("\(type(of: self)).store")
    }
    
    private func cachesDirectory() -> URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
}
