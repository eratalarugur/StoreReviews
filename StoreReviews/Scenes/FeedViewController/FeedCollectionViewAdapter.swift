//
//  FeedCollectionViewAdapter.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 27.10.2020.
//

import UIKit

protocol FeedCollectionViewAdapterDelegate: class {
	func didSelectItem(with: ReviewApplicationModel)
}

class FeedCollectionViewAdapter: NSObject {
	
	private weak var feedCollectioinView: UICollectionView!
	var dataSource: [ReviewApplicationModel]
	weak var delegate: FeedCollectionViewAdapterDelegate?
	static let cellName = TypeHelper.getClassName(FeedPostCell.self)

	// MARK: - Init -
	init(collectionView: UICollectionView, dataSource: [ReviewApplicationModel], delegate: FeedCollectionViewAdapterDelegate?) {
		self.feedCollectioinView = collectionView
		self.dataSource = dataSource
		self.delegate = delegate
		super.init()
		setupCollectionView()
	}
	
	// MARK: - Setup -
	func setupCollectionView() {
		self.feedCollectioinView.delegate = self
		self.feedCollectioinView.dataSource = self
		registerCells()
	}
	func registerCells() {
		FeedPostCell.register(to: feedCollectioinView, with: FeedCollectionViewAdapter.cellName)
	}
}

extension FeedCollectionViewAdapter: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		return dataSource.count
		return 5
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewAdapter.cellName, for: indexPath) as? FeedPostCell else { return UICollectionViewCell() }
		
//		let review = dataSource[indexPath.item]
//		cell.configure(with: review)
		return cell
	}
}

extension FeedCollectionViewAdapter: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("review selected")
//		let review = dataSource[indexPath.item]
//		delegate?.didSelectItem(with: review)
	}
}

extension FeedCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.size.width, height: 160)
	}
}
