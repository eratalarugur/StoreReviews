//
//  ContentAttributeResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct ContentAttributeResponseModel {
	var type: String
}

extension ContentAttributeResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case type
	}
}
