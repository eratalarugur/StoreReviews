//
//  FeedDetailInteractor.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

protocol FeedDetailInteractorProtocol: BaseInteractorProtocol {
}

class FeedDetailInteractor: BaseInteractor, FeedDetailInteractorProtocol {
	
	// MARK: - Dependencies -
	var presenter: FeedDetailPresenterProtocol?
}
