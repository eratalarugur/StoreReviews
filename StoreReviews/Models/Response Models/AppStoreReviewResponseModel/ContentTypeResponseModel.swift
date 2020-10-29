//
//  ContentTypeResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct ContentTypeResponseModel {
	var attributes: ContentTypeAttributesResponseModel
}

extension ContentTypeResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case attributes
	}
}
