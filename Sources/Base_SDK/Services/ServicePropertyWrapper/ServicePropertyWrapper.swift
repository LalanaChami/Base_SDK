//
//  ServicePropertyWrapper.swift
//  
//
//  Created by Lalana Chamika on 2023-12-03.
//

import Foundation

@propertyWrapper
struct Service<Service> {

    var service: Service

    init(_ type: ServiceType = .automatic) {
        guard let service = ServiceContainer.resolve(type, Service.self) else {
            let serviceName = String(describing: Service.self)
            fatalError("No service of type \(serviceName) registered!")
        }

        self.service = service
    }

    var wrappedValue: Service {
        get { self.service }
        mutating set { service = newValue }
    }
}
