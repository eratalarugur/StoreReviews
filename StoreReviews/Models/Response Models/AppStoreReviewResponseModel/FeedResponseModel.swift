//
//  FeedResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct FeedResponseModel {
	var author: AuthorResponseModel
	var entry: [EntryResponseModel]
	var updated: SingleResponseModel
	var rights: SingleResponseModel
	var feedTitle: SingleResponseModel
	var icon: SingleResponseModel
	var link: [LinkResponseModel]
	var feedID: SingleResponseModel
}

extension FeedResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case author
		case entry
		case updated
		case rights
		case feedTitle = "title"
		case icon
		case link
		case feedID = "id"
	}
}
