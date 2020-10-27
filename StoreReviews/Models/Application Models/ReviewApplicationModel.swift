//
//  ReviewApplicationModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 27.10.2020.
//

import Foundation

struct ReviewApplicationModel {
	
	var reviewTitle: String
	var rating: String
	var reviewDescription: String
	var username: String
	var version: String
	
	init(with appStoreReviewResponseModel: AppStoreReviewResponseModel) {
		
		self.reviewTitle = appStoreReviewResponseModel.reviewTitle
		self.rating = appStoreReviewResponseModel.rating
		self.reviewDescription = appStoreReviewResponseModel.reviewDescription
		self.username = appStoreReviewResponseModel.username
		self.version = appStoreReviewResponseModel.version
		
	}
	
}
