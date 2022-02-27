//
//  ScrollerFeedLoader.swift
//  ScrollerCodeSample (iOS)
//
//  Created by Kyle Vigorito on 2/27/22.
//

import Foundation

public protocol ScrollerFeedLoader {
    typealias Result = Swift.Result<[ScrollerFeedImage], Error>

    func load(completion: @escaping (Result) -> Void)
}
