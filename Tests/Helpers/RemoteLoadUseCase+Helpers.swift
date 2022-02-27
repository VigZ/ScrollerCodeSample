//
//  RemoteLoadUseCase+Helpers.swift
//  ScrollerCodeSample (iOS)
//
//  Created by Kyle Vigorito on 2/27/22.
//

import XCTest
import ScrollerCodeSample

extension RemoteLoadUseCaseTests {
    func expect(_ sut: RemoteScrollerFeedLoader, toCompleteWith expectedResult: Result<[ScrollerFeedImage], RemoteScrollerFeedLoader.Error>, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "Wait for load completion")

        sut.load { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedItems), .success(expectedItems)):
                XCTAssertEqual(receivedItems, expectedItems, file: file, line: line)

            case let (.failure(receivedError as RemoteScrollerFeedLoader.Error), .failure(expectedError)):
                XCTAssertEqual(receivedError, expectedError, file: file, line: line)

            default:
                XCTFail("Expected result \(expectedResult) got \(receivedResult) instead", file: file, line: line)
            }

            exp.fulfill()
        }

        action()

        waitForExpectations(timeout: 0.1)
    }
}
