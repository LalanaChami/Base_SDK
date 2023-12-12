//
//  PortfolioServiceTest.swift
//
//
//  Created by Lalana Chamika on 2023-12-11.
//

import XCTest
import Combine
@testable import Base_SDK

@available(iOS 13.0, *)
final class PortfolioServiceTest: XCTestCase {

    var sut: PortfolioService!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        sut = PortfolioService()
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testPortfolioDataIsFetched() {
        // Given
        let expectation = XCTestExpectation(description: "Portfolio data should be fetched")
        
        // When
        sut.$porfolioData
            .dropFirst() // Ignore the initial empty value
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Then
        wait(for: [expectation], timeout: 5.0) // Adjust the timeout as needed
        XCTAssertFalse(sut.porfolioData.isEmpty, "Portfolio data should not be empty after fetching")
    }
    
    func testPortfolioDataIsEmptyOnError() {
        // Given
        let expectation = XCTestExpectation(description: "Error should be handled and portfolio data should be empty")
        
        // When
        let mockURL = URL(string: "https://invalid.url")!
        TradeNetworkManager.getDataFromAPI(url: mockURL)
            .decode(type: [PortfolioEntity].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                if case .failure(_) = completion {
                    expectation.fulfill()
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        // Then
        wait(for: [expectation], timeout: 5.0) // Adjust the timeout as needed
        XCTAssertTrue(sut.porfolioData.isEmpty, "Portfolio data should be empty when there is an error")
    }
}
