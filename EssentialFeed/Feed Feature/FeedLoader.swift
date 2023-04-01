//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Gabriel Maldonado Almendra on 1/4/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
