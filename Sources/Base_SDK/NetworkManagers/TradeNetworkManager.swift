//
//  File.swift
//  
//
//  Created by Lalana Chamika on 2023-11-30.
//

import Foundation
import Combine

class TradeNetworkManager {
    
    @available(iOS 13.0, *)
    static func getDataFromAPI(url: URL) -> AnyPublisher<Data, Error> {
       return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { try handleURLResponse(output: $0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    @available(iOS 13.0, *)
    private static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    @available(iOS 13.0, *)
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error as URLError):
            print("URLError: \(error.localizedDescription)")
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
    
}