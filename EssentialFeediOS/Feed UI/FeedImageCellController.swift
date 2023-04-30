//
//  FeedImageCellController.swift
//  EssentialFeediOS
//
//  Created by Gabriel Maldonado Almendra on 30/4/23.
//

import UIKit
import EssentialFeed

final class FeedImageCellController {
    private var task: FeedImageDataLoaderTask?
    private var model: FeedImage
    private var imageLoader: FeedImageDataLoader
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    func view() -> UITableViewCell {
        let cell = FeedImageCell()

        cell.locationContainer.isHidden = (model.location == nil)
        cell.descriptionLabel.text = model.description
        cell.locationLabel.text = model.location
        cell.feedImageView.image = nil // Start as nil when starts loading to avoid issues when reusing cells
        cell.feedImageRetryButton.isHidden = true
        cell.feedImageContainer.startShimmering()
   
        let loadImage = { [weak self, weak cell] in
            guard let self = self else { return }
            
            self.task = self.imageLoader.loadImageData(from: self.model.url) { [weak cell] result in
                let data = try? result.get()
                let image = data.map(UIImage.init) ?? nil
                cell?.feedImageView.image = data.map(UIImage.init) ?? nil
                cell?.feedImageRetryButton.isHidden = (image != nil)
                cell?.feedImageContainer.stopShimmering()
            }
        }
        
        cell.onRetry = loadImage
        loadImage()

        return cell
    }
    
    func preload() {
        task = imageLoader.loadImageData(from: model.url, completion: { _ in })
    }
    
    deinit {
        task?.cancel()
    }
}
