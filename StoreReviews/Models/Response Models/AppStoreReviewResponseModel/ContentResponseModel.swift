//
//  ContentResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct ContentResponseModel {
	var label: String
	var attributes: ContentAttributeResponseModel
}

extension ContentResponseModel: Codable {
	enum CodinKeys: String, CodingKey {
		case label
		case attributes
	}
}
