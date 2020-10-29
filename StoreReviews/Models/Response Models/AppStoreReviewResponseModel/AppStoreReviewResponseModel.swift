//
//  AppStoreReviewResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 27.10.2020.
//

import Foundation

struct AppStoreReviewResponseModel {
	var feed: FeedResponseModel
}

extension AppStoreReviewResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case feed
	}
}
