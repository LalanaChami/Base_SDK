//
//  WeakInject.swift
//  
//
//  Created by Lalana Thanthirigama on 2024-01-16.
//

import Foundation


@propertyWrapper
public struct WeakInject<Value> {
  
  private weak var underlyingValue: AnyObject?
  
  public var wrappedValue: Value? {
    return underlyingValue as? Value
  }
  
  public init(container: DependencyContainerProtocol = DependencyContainer.shared, key: String? = nil, mode: DependencyResolveMode = .shared) {
    if let key = key {
      self.underlyingValue = container.resolve(key: key, mode: mode)
    } else {
      self.underlyingValue = container.resolve(type: Value.self, mode: mode) as AnyObject
    }
  }
    
}
