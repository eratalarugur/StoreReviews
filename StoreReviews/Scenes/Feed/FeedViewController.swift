//
//  FeedViewController.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation
import UIKit

protocol FeedViewControllerProtocol: BaseViewControllerProtocol {
	func displayFeeds(reviews: [ReviewApplicationModel])
}

class FeedViewController: BaseViewController, UICollectionViewDelegateFlowLayout {
	
	// MARK: - Properties -
	let sceneTitle = "Feeds"
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
		searchBar.sizeToFit()
		return searchBar
	}()
	
	var searchBarContainer: UIView = {
		let view = UIView()
		view.backgroundColor = .systemRed
		return view
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
		let interactor = FeedInteractor(networkService: APIClient.shared)
		let presenter = FeedPresenter()
		presenter.viewController = self
		interactor.presenter = presenter
		self.interactor = interactor
		configureView()
	}
	
	func configureView() {
		navigationItem.title = sceneTitle
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(searchButtonTapped))
		navigationItem.titleView = searchBar
		setupCollectionView()
	}
	
	func setupCollectionView() {
		self.feedCollectionViewAdapter = FeedCollectionViewAdapter(collectionView: feedCollectionView, dataSource: reviewList, delegate: self)
		self.view.addSubview(self.feedCollectionView)
		self.feedCollectionView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		self.feedCollectionView.alwaysBounceVertical = true
		self.feedCollectionView.keyboardDismissMode = .onDrag
	}

	//	MARK: - Selectors -
	@objc func searchButtonTapped() {
		
		guard let searchText = searchBar.searchTextField.text else { return }
		
		if searchText.isEmpty {
			filteredReviewList = reviewList
			searchBar.resignFirstResponder()
		} else {
			self.filteredReviewList = self.reviewList.filter {
				$0.reviewTitle.range(of: searchText, options: .caseInsensitive) != nil ||
				$0.reviewDescription.range(of: searchText, options: .caseInsensitive) != nil ||
				$0.username.range(of: searchText, options: .caseInsensitive) != nil ||
				$0.version.range(of: searchText, options: .caseInsensitive) != nil
			}
		}
		feedCollectionViewAdapter?.updateDatasource(dataSource: self.filteredReviewList)
	}
}
extension FeedViewController: FeedCollectionViewAdapterDelegate {
	func didSelectItem(review: ReviewApplicationModel) {
		let detailVC = FeedDetailViewController()
		detailVC.review = review
		present(detailVC, animated: true, completion: nil)
	}
}
extension FeedViewController: FeedViewControllerProtocol {
	func displayFeeds(reviews: [ReviewApplicationModel]) {
		reviewList = reviews
		self.feedCollectionViewAdapter?.updateDatasource(dataSource: reviewList)
	}
}
extension FeedViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar,textDidChange searchText: String) {
		if searchText.isEmpty {
			filteredReviewList = reviewList
			feedCollectionViewAdapter?.updateDatasource(dataSource: self.filteredReviewList)
		}
	}
}


