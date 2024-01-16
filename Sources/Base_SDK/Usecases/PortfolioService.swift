//
//  PortfolioService.swift
//
//
//  Created by Lalana Chamika on 2023-11-30.
//

import Foundation
import Combine

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public class PortfolioService {
    
    @Published public var porfolioData: [PortfolioEntity] = []
    var portfolioSubscribtion : AnyCancellable?
    
    public init() {
        getPortfolioData()
    }
    
    private func getPortfolioData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=2&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=5")
        else {
            return
        }
                
        portfolioSubscribtion = TradeNetworkManager.getDataFromAPI(url: url)
            .decode(type: [PortfolioEntity].self, decoder: JSONDecoder())
            .sink(receiveCompletion: TradeNetworkManager.handleCompletion, receiveValue: { [weak self] (returnedPortfolioData) in
                self?.porfolioData = returnedPortfolioData
                self?.portfolioSubscribtion?.cancel()
            })

    }
}
