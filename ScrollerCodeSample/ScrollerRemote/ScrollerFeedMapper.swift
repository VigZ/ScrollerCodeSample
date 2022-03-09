//
//  ScrollerFeedMapper.swift
//  ScrollerCodeSample (iOS)
//
//  Created by Kyle Vigorito on 2/27/22.
//

import Foundation
final class ScrollerFeedMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedImage]
    }

    static let VALID_CODES = [200]

    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedImage] {
        guard VALID_CODES.contains(response.statusCode), let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteScrollerFeedLoader.Error.invalidData
        }

        return root.items
    }
}
