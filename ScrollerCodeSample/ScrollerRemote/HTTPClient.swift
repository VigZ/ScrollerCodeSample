//
//  HTTPClient.swift
//  ScrollerCodeSample (iOS)
//
//  Created by Kyle Vigorito on 2/27/22.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    func get(from url: URL, completion: @escaping (Result) -> Void)
}
