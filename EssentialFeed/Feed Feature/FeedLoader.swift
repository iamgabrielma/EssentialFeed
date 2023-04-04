//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Gabriel Maldonado Almendra on 1/4/23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
