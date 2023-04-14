//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Gabriel Maldonado Almendra on 14/4/23.
//
import Foundation

public final class LocalFeedLoader {
    
    private let store: FeedStore
    private let currentDate:  () -> Date
    
    public typealias SaveResult = Error?
    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(items: [FeedImage], completion: @escaping (SaveResult) -> Void ) {
        store.deleteCachedFeed { [weak self] error in
            guard let self = self else { return }
            if let cacheDeletionError = error {
                completion(cacheDeletionError)
            } else {
                self.cacheItems(items, with: completion)
            }
        }
    }
    
    private func cacheItems(_ items: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
        store.insert(items.toLocal(), timestamp: currentDate(), completion: { [weak self] error in
            guard self != nil else { return }
            completion(error)
        })
    }
}

private extension Array where Element == FeedImage {
    func toLocal() -> [LocalFeedImage] {
        return map{ LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    }
}
