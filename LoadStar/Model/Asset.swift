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
	return nil
}
