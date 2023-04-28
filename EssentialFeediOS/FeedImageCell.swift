//
//  FeedImageCell.swift
//  EssentialFeediOS
//
//  Created by Gabriel Maldonado Almendra on 23/4/23.
//

import UIKit

final public class FeedImageCell: UITableViewCell {
    public var locationContainer = UIView()
    public var feedImageContainer = UIView()
    public var descriptionLabel = UILabel()
    public var locationLabel = UILabel()
    public var feedImageView = UIImageView()
    
    var onRetry: (() -> Void)?

    private(set) public lazy var feedImageRetryButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func retryButtonTapped() {
        onRetry?()
    }
}
