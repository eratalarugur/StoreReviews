//
//  FeedInteractor.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation

protocol FeedInteractorProtocol: BaseInteractorProtocol {
	func getFeeds()
}

class FeedInteractor: BaseInteractor, FeedInteractorProtocol {

	// MARK: - Dependencies -
	var presenter: FeedPresenterProtocol?
	
	// MARK: - Business -
	func getFeeds() {
		self.presenter?.showFeeds()
	}
}
