//
//  Routable.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

typealias Headers = [String: String]

protocol Routable {
	var baseURL: URL { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var task: Task { get }
	var headers: Headers? { get }
	var parametersEncoding: ParametersEncoding { get }
}
