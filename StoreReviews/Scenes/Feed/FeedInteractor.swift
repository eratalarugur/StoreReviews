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
		self.networkService.request(response: AppStoreReviewResponseModel.self, router: APIRouter.appStoreReviews) { (response) in
			
			switch response {
			case .success(let responseResult):
				print(responseResult)
				self.presenter?.showAppstoreReviews(appStoreReviews: responseResult)

			case .failure(let err):
				print(err)
			}
		}
	}
}
