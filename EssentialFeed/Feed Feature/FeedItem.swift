//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Gabriel Maldonado Almendra on 1/4/23.
//

import Foundation

struct FeedItem {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}