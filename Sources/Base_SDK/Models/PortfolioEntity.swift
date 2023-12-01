//
//  PortfolioEntity.swift
//  
//
//  Created by Lalana Chamika on 2023-11-30.
//

import Foundation

struct PortfolioEntity: Codable {
    
    public let id , headingTitile, icon, holdingCurency: String?
    public let netChangePercentage: Double?
    public let netChangeAmount: Double?
    public let holdingAmount: Double?
    public let updatedDate: Date

    enum CodingKeys: String, CodingKey {
        case id
        case headingTitile = "title"
        case icon = "icon_url"
        case holdingAmount = "holding_amount"
        case netChangePercentage = "change_percentage"
        case netChangeAmount = "net_change_amount"
        case holdingCurency = "currency"
        case updatedDate = "updated_date"
    }
    
    func getHoldingsData() -> PortfolioEntity {
        return PortfolioEntity(id: id, headingTitile: headingTitile, icon: icon, holdingCurency: holdingCurency, netChangePercentage: netChangePercentage, netChangeAmount: netChangeAmount, holdingAmount: holdingAmount, updatedDate: updatedDate)
    }
    
}

