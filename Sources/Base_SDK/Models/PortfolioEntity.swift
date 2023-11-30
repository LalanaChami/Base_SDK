//
//  PortfolioEntity.swift
//  
//
//  Created by Lalana Chamika on 2023-11-30.
//

import Foundation

public struct PortfolioEntity: Identifiable {
    
    public let id , headingTitile, icon: String
    public let netChangePercentage: Double
    public let netChangeAmount: Double
    public let holdingAmount: Double
    
    
    enum CodingKeys: String, CodingKey {
        case id = "portfolio_key"
        case headingTitile = "title"
        case icon = "icon_url"
        case netChangePercentage = "changePercentage"
    }
    
    func getHoldingsData() -> PortfolioEntity {
        return PortfolioEntity(id: id, headingTitile: headingTitile, icon: icon, netChangePercentage: netChangePercentage, netChangeAmount: netChangeAmount, holdingAmount: holdingAmount)
    }
    
    
}
