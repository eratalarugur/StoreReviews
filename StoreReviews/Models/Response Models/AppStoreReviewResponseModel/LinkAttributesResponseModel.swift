//
//  LinkAttributes.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct LinkAttributesResponseModel {
	var rel: String
	var href: String
}

extension LinkAttributesResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case rel
		case href
	}
}
