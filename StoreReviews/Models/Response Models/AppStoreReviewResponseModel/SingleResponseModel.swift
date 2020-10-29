//
//  SingleResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct SingleResponseModel {
	var label: String
}

extension SingleResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case label
	}
}
