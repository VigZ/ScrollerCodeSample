//
//  RemoteFeedImage.swift
//  ScrollerCodeSample (iOS)
//
//  Created by Kyle Vigorito on 2/28/22.
//

import Foundation

struct RemoteFeedImage: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL

    enum CodingKeys: String, CodingKey {
        case id = "image_id"
        case description = "image_desc"
        case location = "image_loc"
        case image = "image_url"
    }
}
