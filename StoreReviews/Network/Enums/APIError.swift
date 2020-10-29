//
//  APIError.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

enum APIError {
	case unknown
	case noJSONData
	case decodingError(Error)
}
