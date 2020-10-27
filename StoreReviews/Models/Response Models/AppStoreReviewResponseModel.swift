//
//  AppStoreReviewResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 27.10.2020.
//

import Foundation

struct AppStoreReviewResponseModel {
	
	var reviewId: String
	var reviewTitle: String
	var rating: String
	var reviewDescription: String
	var username: String
	var version: String
	
}

extension AppStoreReviewResponseModel: Codable {
	
	enum CodingKeys: String, CodingKey {
	
		case reviewId
		case reviewTitle = "title"
		case rating
		case reviewDescription = "description"
		case username = "name"
		case version
		
	}
	
}
