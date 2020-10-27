//
//  FeedViewController.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation
import UIKit

protocol FeedViewControllerProtocol: BaseViewControllerProtocol {
	func displayFeeds()
}

class FeedViewController: BaseViewController, UICollectionViewDelegateFlowLayout {
	
	static let sceneTitle = "Feeds"
	
	// MARK: - Properties -
	var filteredReviewList = [ReviewApplicationModel]()
	var reviewList = [ReviewApplicationModel]()
	var interactor: FeedInteractorProtocol?
	var feedCollectionViewAdapter: FeedCollectionViewAdapter?
	
	// MARK: - UI Components -
	var feedCollectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout())
		collectionView.backgroundColor = .clear
		collectionView.alwaysBounceVertical = true
		collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
		collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: -50, right: 0)
		return collectionView
	}()
	
	lazy var searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.placeholder = "Enter Key to search"
		searchBar.delegate = self
		return searchBar
	}()
	
	// MARK: - Lifecycle -
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		interactor?.getFeeds()
	}
	
	// MARK: - Setup -
	func setup() {
		let interactor = FeedInteractor()
		let presenter = FeedPresenter()
		presenter.viewController = self
		interactor.presenter = presenter
		self.interactor = interactor
		configureView()
	}
	
	func configureView() {
		self.view.backgroundColor = UIColor.rgb(red: 245, green: 245, blue: 245)
		navigationItem.title = FeedViewController.sceneTitle
		setupCollectionView()
		setupSearchBar()
	}
	
	func setupCollectionView() {
		self.feedCollectionViewAdapter = FeedCollectionViewAdapter(collectionView: feedCollectionView, dataSource: reviewList, delegate: self)
		self.view.addSubview(self.feedCollectionView)
		self.feedCollectionView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		self.feedCollectionView.alwaysBounceVertical = true
		self.feedCollectionView.keyboardDismissMode = .onDrag
	}
	func setupSearchBar() {
//		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(searchButtonTapped))
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(searchButtonTapped))
//		let navBar = navigationController?.navigationBar
//		searchBar.anchor(top: navBar?.topAnchor, left: navBar?.leftAnchor, bottom: navBar?.bottomAnchor, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
	}
	
	@objc func searchButtonTapped() {
		print("search button tapped!")
	}
}
extension FeedViewController: FeedCollectionViewAdapterDelegate {
	func didSelectItem(with: ReviewApplicationModel) {
	}
}
extension FeedViewController: FeedViewControllerProtocol {
	func displayFeeds() {
		print("display feeds")
	}
}
extension FeedViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if searchText.isEmpty {
			filteredReviewList = reviewList
		} else {
			self.filteredReviewList = self.reviewList.filter { (key) -> Bool in
				return true
			}
		}
		self.feedCollectionView.reloadData()
	}
}

