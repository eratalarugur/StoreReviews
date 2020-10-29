//
//  FeedPresenter.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation

protocol FeedPresenterProtocol: BasePresenterProtocol {
	func showAppstoreReviews(appStoreReviews: AppStoreReviewResponseModel)
}

class FeedPresenter: BasePresenter, FeedPresenterProtocol {
	
	// MARK: - Dependencies -
	var viewController: FeedViewControllerProtocol?
	
	// MARK: - Delegates -
	func showAppstoreReviews(appStoreReviews: AppStoreReviewResponseModel) {
		let reviewList = appStoreReviews.feed.entry
		let reviews = reviewList.map ( { return ReviewApplicationModel(with: $0)} )
		viewController?.displayFeeds(reviews: reviews)
	}
}
