//
//  LinkResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct LinkResponseModel {
	var attributes: LinkAttributesResponseModel
}

extension LinkResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case attributes
	}
}
