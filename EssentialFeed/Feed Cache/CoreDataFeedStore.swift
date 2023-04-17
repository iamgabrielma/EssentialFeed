//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Gabriel Maldonado Almendra on 18/4/23.
//

import Foundation

public final class CoreDataFeedStore: FeedStore {
    
    public init() {
        
    }

    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
    
    public func insert(_ feed: [EssentialFeed.LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
}
