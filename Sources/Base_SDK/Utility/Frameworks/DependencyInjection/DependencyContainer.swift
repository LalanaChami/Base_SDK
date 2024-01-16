//
//  DependencyContainer.swift
//  
//
//  Created by Lalana Thanthirigama on 2024-01-16.
//

import Foundation

public class DependencyContainer {
    
    public static let shared: DependencyContainerProtocol = DependencyContainer()
    public var dependencyInitializer: [String: () -> Any] = [:]
    public var dependencyShared: [String: Any] = [:]
    
}

