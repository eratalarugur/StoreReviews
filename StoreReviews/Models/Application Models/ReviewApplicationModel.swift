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
	
	init(with entry: EntryResponseModel) {
		
		self.reviewTitle = entry.entryTitle.label
		self.rating = entry.rating.label
		self.reviewDescription = entry.content.label
		self.username = entry.author.name.label
		self.version = entry.version.label
		
	}
	
}
