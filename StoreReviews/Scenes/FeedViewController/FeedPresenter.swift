//
//  FeedPresenter.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation

protocol FeedPresenterProtocol: BasePresenterProtocol {
	func showFeeds()
}

class FeedPresenter: BasePresenter, FeedPresenterProtocol {
	
	// MARK: - Dependencies -
	var viewController: FeedViewControllerProtocol?
	
	// MARK: - Delegates -
	func showFeeds() {
		viewController?.displayFeeds()
	}
}
