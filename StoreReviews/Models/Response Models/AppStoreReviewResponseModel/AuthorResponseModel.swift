//
//  AuthorResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct AuthorResponseModel {
	var uri: SingleResponseModel
	var name: SingleResponseModel
}

extension AuthorResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case uri
		case name
	}
}
