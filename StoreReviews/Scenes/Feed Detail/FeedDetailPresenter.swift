//
//  FeedDetailPresenter.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

protocol FeedDetailPresenterProtocol: BasePresenterProtocol {
}

class FeedDetailPresenter: BasePresenter, FeedDetailPresenterProtocol {
	
	//	MARK: - Dependencies -
	var viewController: FeedDetailViewControllerProtocol?
}
