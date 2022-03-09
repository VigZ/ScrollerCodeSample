//
//  RemoteScrollerFeedLoader.swift
//  ScrollerCodeSample (iOS)
//
//  Created by Kyle Vigorito on 2/27/22.
//

import Foundation

public final class RemoteScrollerFeedLoader: ScrollerFeedLoader {
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (ScrollerFeedLoader.Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success((data, response)):
                completion(RemoteScrollerFeedLoader.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse -> ScrollerFeedLoader.Result {
        do {
            let items = try ScrollerFeedMapper.map(data, from: response)
            return .success(items.toModel())
        } catch {
            return .failure(error)
        }
    }
}
    
private extension Array where Element == RemoteFeedImage {
        func toModel() -> [FeedImage] {
            return map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
        }
}
