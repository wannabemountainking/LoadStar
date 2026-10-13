//
//  Playgrounds.swift
//  LoadStar
//
//  Created by YoonieMac on 10/13/26.
//

import Foundation
import Playgrounds

#Playground {
	let sample = [
		Asset(name: "SCHD", quantity: Decimal(string: "4.8")!, closingPrice: Decimal(string: "1")!, targetWeight: Decimal(string: "0.6")!),
		Asset(name: "VOO",  quantity: Decimal(string: "2.0")!, closingPrice: Decimal(string: "1")!, targetWeight: Decimal(string: "0.2")!),
		Asset(name: "QQQM", quantity: Decimal(string: "3.2")!, closingPrice: Decimal(string: "1")!, targetWeight: Decimal(string: "0.2")!)
	]

	print(calculateWeights(assets: sample) as Any)
	print(calculateWeights(assets: []) as Any)
}
