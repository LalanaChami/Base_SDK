//
//  TradeNetworkManagerTests.swift
//  
//
//  Created by Lalana Chamika on 2023-12-11.
//

import XCTest
import Combine
@testable import Base_SDK

@available(iOS 13.0, *)
final class TradeNetworkManagerTests: XCTestCase {

    func testGetDataFromAPI() {
            // Given
            let url = URL(string: "https://example.com")!
            let expectation = XCTestExpectation(description: "Data should be fetched successfully")

            // When
            let cancellable = TradeNetworkManager.getDataFromAPI(url: url)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        expectation.fulfill()
                    case .failure(let error):
                        XCTFail("Unexpected failure: \(error)")
                    }
                }, receiveValue: { data in
                    // Optionally, you can assert on the received data
                    XCTAssertNotNil(data, "Received data should not be nil")
                })

            // Then
            wait(for: [expectation], timeout: 10.0) // Adjust the timeout as needed
            cancellable.cancel()
        }

        func testHandleURLResponseSuccess() {
            // Given
            let httpResponse = HTTPURLResponse(
                url: URL(string: "https://example.com")!,
                statusCode: 200,
                httpVersion: "HTTP/1.1",
                headerFields: nil
            )!
            let output = URLSession.DataTaskPublisher.Output(
                data: Data(),
                response: httpResponse
            )

            // When
            do {
                let result = try TradeNetworkManager.handleURLResponse(output: output)

                // Then
                XCTAssertNotNil(result, "Result should not be nil")
            } catch {
                XCTFail("Unexpected error: \(error)")
            }
        }

        func testHandleURLResponseFailure() {
            // Given
            let httpResponse = HTTPURLResponse(
                url: URL(string: "https://example.com")!,
                statusCode: 400,
                httpVersion: "HTTP/1.1",
                headerFields: nil
            )!
            let output = URLSession.DataTaskPublisher.Output(
                data: Data(),
                response: httpResponse
            )

            // When
            do {
                // Then
                XCTAssertThrowsError(try TradeNetworkManager.handleURLResponse(output: output))
            }
        }
}
