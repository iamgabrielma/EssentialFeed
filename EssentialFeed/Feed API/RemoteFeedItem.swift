//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Gabriel Maldonado Almendra on 14/4/23.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
