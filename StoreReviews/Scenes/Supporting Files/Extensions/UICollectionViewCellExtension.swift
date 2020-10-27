//
//  UICollectionViewCellExtension.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 27.10.2020.
//

import UIKit

extension UICollectionViewCell {
	
	static func register(to collectionView: UICollectionView?, with cellName: String) {
		collectionView?.register(Self.self, forCellWithReuseIdentifier: cellName)
	}
	
}
