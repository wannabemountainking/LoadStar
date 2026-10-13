//
//  LoadStarTests.swift
//  LoadStarTests
//
//  Created by YoonieMac on 10/13/26.
//

import Testing
import Foundation
@testable import LoadStar   // ← 프로젝트 이름으로 바꾸세요

struct CalculateWeightsTests {

	private func dec(_ s: String) -> Decimal { Decimal(string: s)! }

	private func makeAsset(_ name: String, quantity: String, price: String, target: String) -> Asset {
		Asset(name: name,
			  quantity: dec(quantity),
			  closingPrice: dec(price),
			  targetWeight: dec(target))
	}

	@Test("기본 케이스: 4.8 / 2.0 / 3.2")
	func normal() {
		let assets = [
			makeAsset("SCHD", quantity: "4.8", price: "1", target: "0.6"),
			makeAsset("VOO",  quantity: "2.0", price: "1", target: "0.2"),
			makeAsset("QQQM", quantity: "3.2", price: "1", target: "0.2")
		]
		#expect(calculateWeights(assets: assets)
				== ["SCHD": dec("0.48"), "VOO": dec("0.2"), "QQQM": dec("0.32")])
	}

	@Test("빈 목록은 nil")
	func emptyList() {
		#expect(calculateWeights(assets: []) == nil)
	}

	@Test("전부 수량 0이면 nil")
	func allZero() {
		let assets = [
			makeAsset("SCHD", quantity: "0", price: "100", target: "0.6"),
			makeAsset("VOO",  quantity: "0", price: "100", target: "0.4")
		]
		#expect(calculateWeights(assets: assets) == nil)
	}

	@Test("일부만 0이면 nil이 아니라 그 종목 비중 0")
	func partialZero() {
		let assets = [
			makeAsset("SCHD", quantity: "6", price: "1", target: "0.6"),
			makeAsset("VOO",  quantity: "4", price: "1", target: "0.4"),
			makeAsset("QQQM", quantity: "0", price: "1", target: "0")
		]
		#expect(calculateWeights(assets: assets)
				== ["SCHD": dec("0.6"), "VOO": dec("0.4"), "QQQM": dec("0")])
	}
}
