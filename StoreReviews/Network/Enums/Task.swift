//
//  Task.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation

typealias Parameters = [String: Any]

enum Task {
	case plain
	case parameters(Parameters)
}
