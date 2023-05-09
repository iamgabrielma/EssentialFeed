//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Gabriel Maldonado Almendra on 1/5/23.
//

import EssentialFeed

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

protocol FeedView {
    func display(_ view: FeedViewModel)
}

final class FeedPresenter {
    private let feedView: FeedView
    private let loadingView: FeedLoadingView
    
    init(feedView: FeedView, feedLoadingView: FeedLoadingView) {
        self.feedView = feedView
        self.loadingView = feedLoadingView
    }
    
    func didStartLoadingFeed() {
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoadingFeed(with error: Error) {
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
}
