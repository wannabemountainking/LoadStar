//
//  Playgrounds.swift
//  LoadStar
//
//  Created by YoonieMac on 10/13/26.
//

import Foundation
import Playgrounds

#Playground {
//	let sample = [
//		Asset(name: "SCHD", quantity: Decimal(string: "4.8")!, closingPrice: Decimal(string: "1")!, targetWeight: Decimal(string: "0.6")!),
//		Asset(name: "VOO",  quantity: Decimal(string: "2.0")!, closingPrice: Decimal(string: "1")!, targetWeight: Decimal(string: "0.2")!),
//		Asset(name: "QQQM", quantity: Decimal(string: "3.2")!, closingPrice: Decimal(string: "1")!, targetWeight: Decimal(string: "0.2")!)
//	]
//
//	print(calculateWeights(assets: sample) as Any)
//	print(calculateWeights(assets: []) as Any)
	
	func d(_ s: String) -> Decimal { Decimal(string: s)! }
//
//	let sample: [Asset] = [
//		Asset(name: "SCHD", quantity: d("50"), closingPrice: d("1"), targetWeight: d("0.4")),
//		Asset(name: "VOO",  quantity: d("25"), closingPrice: d("1"), targetWeight: d("0.3")),
//		Asset(name: "QQQM", quantity: d("25"), closingPrice: d("1"), targetWeight: d("0.3"))
//	]
//
//	print(calculateDeviations(assets: sample) as Any)
	
	let sample: [Asset] = [
		Asset(name: "VOO", quantity: d("1"), closingPrice: d("1"), targetWeight: d("0.5")),
		Asset(name: "SCHD", quantity: d("1"), closingPrice: d("1"), targetWeight: d("0.4")),
		Asset(name: "VOO", quantity: d("1"), closingPrice: d("1"), targetWeight: d("0.1"))
	]
//	
//	print(judgment(assets: sample) as Any)
	
	func a(_ name: String, _ qty: String, _ target: String) -> Asset {
		Asset(name: name, quantity: d(qty), closingPrice: d("1"), targetWeight: d(target))
	}
	let limit = d("0.1")

	// 1. SCHD가 목표보다 0.10 많음 → 이탈
	let sampleOver: [Asset] = [a("SCHD", "50", "0.4"), a("VOO", "25", "0.3"), a("QQQM", "25", "0.3")]

	// 2. SCHD가 목표보다 0.10 부족 → 이탈이어야 함
	let sampleUnder: [Asset] = [a("SCHD", "30", "0.4"), a("VOO", "35", "0.3"), a("QQQM", "35", "0.3")]

	// 3. 한도에 아주 조금 못 미침 → 정상
	let sampleJustUnder: [Asset] = [a("SCHD", "49", "0.4"), a("VOO", "25.5", "0.3"), a("QQQM", "25.5", "0.3")]

	// 4. 허용 범위 안 → 정상
	let sampleInRange: [Asset] = [a("SCHD", "42", "0.4"), a("VOO", "29", "0.3"), a("QQQM", "29", "0.3")]
	
	// 목표 비중 합이 0.9
	let sampleSumInvalid: [Asset] = [a("SCHD", "50", "0.4"), a("VOO", "25", "0.3"), a("QQQM", "25", "0.2")]
	// 평가금액 합이 0
	let sampleZeroTotal: [Asset] = [a("SCHD", "0", "0.4"), a("VOO", "0", "0.3"), a("QQQM", "0", "0.3")]
	// 빈 목록
	let sampleEmpty: [Asset] = []

//	print("1 많음:", judgment(assets: sampleOver, limit: limit))
//	print("2 부족:", judgment(assets: sampleUnder, limit: limit))
//	print("3 근접:", judgment(assets: sampleJustUnder, limit: limit))
//	print("4 범위 안:", judgment(assets: sampleInRange, limit: limit))
	
	print(judgment(assets: sampleOver))                       // 기본값 사용
	print(judgment(assets: sampleOver, limit: d("0.2")))      // 직접 지정
	print(judgment(assets: sampleSumInvalid))                       // 기본값 사용
	print(judgment(assets: sampleSumInvalid, limit: d("0.2")))      // 직접 지정
	print(judgment(assets: sampleZeroTotal))                       // 기본값 사용
	print(judgment(assets: sampleZeroTotal, limit: d("0.2")))      // 직접 지정
	print(judgment(assets: sampleEmpty))                       // 기본값 사용
	print(judgment(assets: sampleEmpty, limit: d("0.2")))      // 직접 지정

}
