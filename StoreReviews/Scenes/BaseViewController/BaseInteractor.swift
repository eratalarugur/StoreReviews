//
//  BaseInteractor.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation

protocol BaseInteractorProtocol: class {
}

class BaseInteractor: BaseInteractorProtocol {
	internal var networkService: APIClient!
	
	init(networkService: APIClient? = nil) {
		if let networkService = networkService {
			self.networkService = networkService
		}
	}
}
