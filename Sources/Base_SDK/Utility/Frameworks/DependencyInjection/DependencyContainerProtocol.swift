//
//  DependencyContainerProtocol.swift
//  
//
//  Created by Lalana Thanthirigama on 2024-01-16.
//

import Foundation

public protocol DependencyContainerProtocol {
    
    func register<DependencyType>(type: DependencyType.Type, dependency: @escaping () -> DependencyType)
    func resolve<DependencyType>(type: DependencyType.Type, mode: DependencyResolveMode) -> DependencyType
    
    func register<DependencyType>(key: String, dependency:  @escaping () -> DependencyType)
    func resolve<DependencyType>(key: String, mode: DependencyResolveMode) -> DependencyType
    
}
