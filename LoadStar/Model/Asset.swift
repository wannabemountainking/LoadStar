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

struct AssetDeviation {
	let name: String
	let deviation: Decimal
}

enum JudgmentFailure {
	case zeroTotalValue
	case targetWeightsSumInvalid
	case duplicateName(name: String)
	case notANumber(name: String)
}

enum JudgmentResult {
	case needsRebalancing(deviations: [AssetDeviation])
	case noActionNeeded
	case cannotJudge(reason: JudgmentFailure)
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

func calculateDeviations(assets: [Asset]) -> [AssetDeviation]? {
	guard let weights = calculateWeights(assets: assets) else {return nil}
	let deviations = assets.reduce(into: [AssetDeviation]()) { prevDeviations, asset in
		guard let currentWeight = weights[asset.name] else {return}
		let deviation = currentWeight - asset.targetWeight
		let assetDeviation = AssetDeviation(name: asset.name, deviation: deviation)
		prevDeviations.append(assetDeviation)
	}
	return deviations
}
