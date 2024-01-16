//
//  Inject.swift
//  
//
//  Created by Lalana Thanthirigama on 2024-01-16.
//

import Foundation

@propertyWrapper
public struct Inject<Value> {
    
  private(set) public var wrappedValue: Value
  
  public init(container: DependencyContainerProtocol = DependencyContainer.shared, key: String? = nil, mode: DependencyResolveMode = .shared) {
    if let key = key {
      wrappedValue = container.resolve(key: key, mode: mode)
    } else {
      wrappedValue = container.resolve(type: Value.self, mode: mode)
    }
  }

}
