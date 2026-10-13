//
//  Asset.swift
//  LoadStar
//
//  Created by YoonieMac on 10/12/26.
//

import Foundation


struct Asset: Identifiable {
	let id = UUID()
	let name: String
	var quantity: Decimal
	var closingPrice: Decimal
	var targetWeight: Decimal
	var marketValue: Decimal { quantity * closingPrice }
}

func calculateWeights(assets: [Asset]) -> [String: Decimal]? {
	
	let totalValue = assets.reduce(0) { $0 + $1.marketValue }
	
	guard totalValue > 0 else {return nil}
	let marketValues = assets.reduce(into: [String: Decimal]()) { result, asset in
		let weight = asset.marketValue / totalValue
		result[asset.name, default: Decimal(0)] += weight
	}
	
	return marketValues
}
