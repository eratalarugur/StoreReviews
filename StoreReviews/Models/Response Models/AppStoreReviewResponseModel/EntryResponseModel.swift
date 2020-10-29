//
//  EntryResponseModel.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 29.10.2020.
//

import Foundation

struct EntryResponseModel {
	var author: AuthorResponseModel
	var version: SingleResponseModel
	var rating: SingleResponseModel
	var entryId:SingleResponseModel
	var entryTitle: SingleResponseModel
	var content: ContentResponseModel
	var link: LinkResponseModel
	var voteSum: SingleResponseModel
	var contentType: ContentTypeResponseModel
	var voteCount: SingleResponseModel
}

extension EntryResponseModel: Codable {
	enum CodingKeys: String, CodingKey {
		case author
		case version = "im:version"
		case rating = "im:rating"
		case entryId = "id"
		case entryTitle = "title"
		case content
		case link
		case voteSum = "im:voteSum"
		case contentType = "im:contentType"
		case voteCount = "im:voteCount"
	}
}
