//
//  StringExtension.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 30.10.2020.
//

import Foundation

extension String {
	func count(of character: Character) -> Int {
		return reduce(0) {
			$1 == character ? $0 + 1 : $0
		}
	}
}
