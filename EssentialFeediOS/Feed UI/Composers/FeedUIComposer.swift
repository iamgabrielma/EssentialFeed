//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Gabriel Maldonado Almendra on 30/4/23.
//

import UIKit
import EssentialFeed

final public class FeedUIComposer {
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let refreshController = FeedRefreshViewController(feedLoader: feedLoader)
        let feedController = FeedViewController(refreshController: refreshController)
        refreshController.onRefresh = { [weak feedController] feed in
            feedController?.tableModel = feed.map { model in
                FeedImageCellController(model: model, imageLoader: imageLoader)
            }
        }
        return feedController
    }
}
