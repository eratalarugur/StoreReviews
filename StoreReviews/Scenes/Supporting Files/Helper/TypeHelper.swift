//
//  TypeHelper.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation

class TypeHelper {
	
	private init() {
	}
	
	public static func getClassName<ClassType>(_ classType: ClassType) -> String {
		return String(describing: classType.self)
	}
}
