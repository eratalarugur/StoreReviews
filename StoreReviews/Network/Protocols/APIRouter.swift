//
//  APIRouter.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

enum APIRouter {
	case appStoreReviews
}

extension APIRouter: Routable {
	
	var baseURL: URL {
		var url = ""
		switch self {
		case .appStoreReviews:
			url = APPSTORE_URL
		}
		return URL(string: url)!
	}
	
	var path: String {
		switch self {
		case .appStoreReviews:
			return "/nl/rss/customerreviews/id=474495017/sortby=mostrecent/json"
		}
	}
	
	var method: HTTPMethod {
		switch self {
		case .appStoreReviews:
			return .get
		}
	}
	
	var task: Task {
		switch self {
		case .appStoreReviews:
			return .plain
		}
	}
	
	var headers: Headers? {
		switch self {
		case .appStoreReviews:
			return ["Content-Type": "application/json", "Accept": "text/plain"]
		}
	}
	
	var parametersEncoding: ParametersEncoding {
		switch self {
		case .appStoreReviews:
			return .url
		}
	}
}
