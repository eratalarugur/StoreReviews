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

		if Reachability.isConnectedToNetwork() {
			self.networkService.request(response: AppStoreReviewResponseModel.self, router: APIRouter.appStoreReviews) { (response) in
				
				switch response {
				case .success(let responseResult):
					self.presenter?.showAppstoreReviews(appStoreReviews: responseResult)
					
				case .failure(let err):
					print("error: ", err)
					self.presenter?.showError(text: NETWORK_DATA_ERROR)
				}
			}
		} else {
			self.presenter?.showError(text: INTERNET_ERROR_MESSAGE)
		}
	}
}
