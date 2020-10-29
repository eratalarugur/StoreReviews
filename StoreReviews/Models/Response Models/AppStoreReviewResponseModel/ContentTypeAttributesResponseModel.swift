//
//  ContentTypeAttributes.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct ContentTypeAttributesResponseModel {
	var term: String
	var label: String
}

extension ContentTypeAttributesResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case term
		case label
	}
}
