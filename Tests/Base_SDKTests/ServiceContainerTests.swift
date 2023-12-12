//
//  ServiceContainerTests.swift
//  
//
//  Created by Lalana Chamika on 2023-12-11.
//

import XCTest
@testable import Base_SDK

// Define a sample service and its protocol for testing
protocol SampleService: AnyObject {
    func doSomething() -> String
}


final class ServiceContainerTests: XCTestCase {
    
    class SampleServiceImpl: SampleService {
        func doSomething() -> String {
            return "Sample service is doing something"
        }
    }

    func testRegisterAndResolveSingleton() {
        // Given
        ServiceContainer.register(type: SampleService.self, SampleServiceImpl())

        // When
        let resolvedService1: SampleService? = ServiceContainer.resolve(.singleton, SampleService.self)
        let resolvedService2: SampleService? = ServiceContainer.resolve(.singleton, SampleService.self)

        // Then
        XCTAssertNotNil(resolvedService1, "Resolved service should not be nil")
        XCTAssertNotNil(resolvedService2, "Resolved service should not be nil")
        XCTAssertTrue(resolvedService1 === resolvedService2, "Resolved services should be the same instance (singleton)")
    }

    func testRegisterAndResolveNewSingleton() {
        // Given
        ServiceContainer.register(type: SampleService.self, SampleServiceImpl())

        // When
        let resolvedService1: SampleService? = ServiceContainer.resolve(.newSingleton, SampleService.self)
        let resolvedService2: SampleService? = ServiceContainer.resolve(.newSingleton, SampleService.self)

        // Then
        XCTAssertNotNil(resolvedService1, "Resolved service should not be nil")
        XCTAssertNotNil(resolvedService2, "Resolved service should not be nil")
        XCTAssertTrue(resolvedService1 === resolvedService2, "Resolved services should be the same instance (new singleton)")
    }

    func testRegisterAndResolveNew() {
        // Given
        ServiceContainer.register(type: SampleService.self, SampleServiceImpl())

        // When
        let resolvedService1: SampleService? = ServiceContainer.resolve(.new, SampleService.self)
        let resolvedService2: SampleService? = ServiceContainer.resolve(.new, SampleService.self)

        // Then
        XCTAssertNotNil(resolvedService1, "Resolved service should not be nil")
        XCTAssertNotNil(resolvedService2, "Resolved service should not be nil")
        XCTAssertFalse(resolvedService1 === resolvedService2, "Resolved services should be different instances (new)")
    }


}
