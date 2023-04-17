//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Gabriel Maldonado Almendra on 15/4/23.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}
