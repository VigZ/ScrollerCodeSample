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
                completion(ScrollerFeedMapper.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
}
