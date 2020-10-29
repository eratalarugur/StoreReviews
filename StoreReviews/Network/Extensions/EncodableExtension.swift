//
//  EncodableExtension.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

extension Encodable {
	
	var convertToJson: [String: Any]? {
		let jsonEncoder = JSONEncoder()
		jsonEncoder.outputFormatting = .prettyPrinted
		do {
			let jsonData = try jsonEncoder.encode(self)
			let json = try! JSONSerialization.jsonObject(with: jsonData as Data, options: [])
			let dict = json as! [String: Any]
			return dict
		} catch {
			return nil
		}
	}
}
