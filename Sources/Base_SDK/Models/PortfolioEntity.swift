//
//  PortfolioEntity.swift
//  
//
//  Created by Lalana Chamika on 2023-11-30.
//

import Foundation

public struct PortfolioEntity: Identifiable, Codable {
    
    public let id , headingTitile, icon, holdingCurency: String?
    public let netChangePercentage: Double?
    public let netChangeAmount: Double?
    public let holdingAmount: Double?
    public let updatedDate: Date

    enum CodingKeys: String, CodingKey {
//        case id
//        case headingTitile = "title"
//        case icon = "icon_url"
//        case holdingAmount = "holding_amount"
//        case netChangePercentage = "change_percentage"
//        case netChangeAmount = "net_change_amount"
//        case holdingCurency = "currency"
//        case updatedDate = "updated_date"
        
        case id
        case headingTitile = "name"
        case icon = "high_24h"
        case holdingAmount = "current_price"
        case netChangePercentage = "market_cap_change_percentage_24h"
        case netChangeAmount = "atl_change_percentage"
        case holdingCurency = "max_supply"
        case updatedDate = "last_updated"
    }
    
    func getHoldingsData() -> PortfolioEntity {
        return PortfolioEntity(id: id, headingTitile: headingTitile, icon: icon, holdingCurency: holdingCurency, netChangePercentage: netChangePercentage, netChangeAmount: netChangeAmount, holdingAmount: holdingAmount, updatedDate: updatedDate)
    }
    
}

