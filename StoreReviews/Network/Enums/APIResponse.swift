//
//  APIResponse.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

enum APIResponse<T: Codable> {
	case success(T)
	case failure(APIError)
}
