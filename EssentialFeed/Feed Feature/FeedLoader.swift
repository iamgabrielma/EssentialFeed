//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Gabriel Maldonado Almendra on 1/4/23.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
