//
//  LazyInject.swift
//  
//
//  Created by Lalana Thanthirigama on 2024-01-16.
//

import Foundation

@propertyWrapper
public struct LazyInject<Value> {
  
  private let container: DependencyContainerProtocol
  private let key: String?
  private let mode: DependencyResolveMode
  
  private(set) public lazy var wrappedValue: Value = {
    if let key = self.key {
      return self.container.resolve(key: key, mode: self.mode)
    } else {
      return self.container.resolve(type: Value.self, mode: self.mode)
    }
  }()

  public init(container: DependencyContainerProtocol = DependencyContainer.shared, key: String? = nil, mode: DependencyResolveMode = .shared) {
    self.container = container
    self.key = key
    self.mode = mode
  }
    
}
