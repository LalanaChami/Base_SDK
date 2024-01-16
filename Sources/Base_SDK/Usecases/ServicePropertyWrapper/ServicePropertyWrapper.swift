//
//  ServicePropertyWrapper.swift
//  
//
//  Created by Lalana Chamika on 2023-12-03.
//

import Foundation

@propertyWrapper
public struct Service<Service> {

    var service: Service

    public init(_ type: ServiceType = .automatic) {
        guard let service = ServiceContainer.resolve(type, Service.self) else {
            let serviceName = String(describing: Service.self)
            fatalError("No service of type \(serviceName) registered!")
        }

        self.service = service
    }

    public var wrappedValue: Service {
        get { self.service }
        mutating set { service = newValue }
    }
}
