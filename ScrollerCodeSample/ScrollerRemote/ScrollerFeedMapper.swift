//
//  ScrollerFeedMapper.swift
//  ScrollerCodeSample (iOS)
//
//  Created by Kyle Vigorito on 2/27/22.
//

import Foundation
final class ScrollerFeedMapper {
    private struct Root: Decodable {
        let items: [Item]

        var feed: [ScrollerFeedImage] {
            return items.map { $0.item }
        }
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL

        var item: ScrollerFeedImage {
            return ScrollerFeedImage(id: id, description: description, location: location, url: image)
        }

        enum CodingKeys: String, CodingKey {
            case id = "image_id"
            case description = "image_desc"
            case location = "image_loc"
            case image = "image_url"
        }
    }

    static let VALID_CODES = [200]

    static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteScrollerFeedLoader.Result {
        guard VALID_CODES.contains(response.statusCode), let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(RemoteScrollerFeedLoader.Error.invalidData)
        }

        return .success(root.feed)
    }
}
