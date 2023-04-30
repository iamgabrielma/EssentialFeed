//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Gabriel Maldonado Almendra on 30/4/23.
//

import UIKit
import EssentialFeed

final class FeedViewModel {
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    private enum State {
        case pending
        case loading
        case loaded([FeedImage])
        case failed
    }
    
    private var state = State.pending {
        didSet {
            onChange?(self)
        }
    }
    
    var onChange: ((FeedViewModel) -> Void)?

    var isLoading: Bool {
        switch state {
        case .loading: return true
        case .pending, .failed, .loaded: return false
        }
    }
    
    var feed: [FeedImage]? {
        switch state {
        case let .loaded(feed): return feed
        case .failed, .pending, .loading: return nil
        }
    }
    
    func loadFeed() {
        state = .loading
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.state = .loaded(feed)
            } else {
                self?.state = .failed
            }
        }
        
    }
}
