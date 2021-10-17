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
	let sceneTitle = FEEDS_VC_SCENE_TITLE
	var allReviews = [ReviewApplicationModel]()
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
		searchBar.placeholder = SEARCH_BAR_PLACEHOLDER
		searchBar.delegate = self
		searchBar.sizeToFit()
		searchBar.searchTextField.delegate = self
		return searchBar
	}()

	@objc func keyTapped(sender: UIBarButtonItem) {
		if let searchKey = sender.title {
			searchBar.searchTextField.text = searchKey
			self.searchButtonTapped()
		}
	}
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
		guard let popularSearches = UserDefaults.standard.dictionary(forKey: SEARCH_KEYS) as? [String: Int] else { return }
		let sortedSearch = popularSearches.sorted { (e1:(key: String, value: Int), e2:(key: String, value: Int)) -> Bool in
			e1.1 > e2.1
		}
		
		let bar = UIToolbar()
		bar.items = []
		let totalCount = sortedSearch.count > 3 ? 3 : sortedSearch.count
		for i in 0..<totalCount {
			let t = sortedSearch[i]
			let suggestion = UIBarButtonItem(title: t.key, style: .plain, target: self, action: #selector(keyTapped(sender:)))
			let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
			bar.items?.append(space)
			bar.items?.append(suggestion)
			if i == totalCount - 1 {
				bar.items?.append(space)
			}
		}
		bar.sizeToFit()
		self.searchBar.searchTextField.inputAccessoryView = bar
	}

	//	MARK: - Selectors -
	var lastSearchKey = ""
	@objc func searchButtonTapped() {
		
		guard let searchText = searchBar.searchTextField.text else { return }
		if searchText == lastSearchKey { return }
		if searchText.isEmpty {
			self.reviewList = self.allReviews
			searchBar.resignFirstResponder()
		} else {
			self.reviewList = self.allReviews.filter {
				$0.reviewTitle.range(of: searchText, options: .caseInsensitive) != nil ||
				$0.reviewDescription.range(of: searchText, options: .caseInsensitive) != nil ||
				$0.username.range(of: searchText, options: .caseInsensitive) != nil ||
				$0.version.range(of: searchText, options: .caseInsensitive) != nil ||
				$0.rating.elementsEqual(searchText)
			}
		}
		lastSearchKey = searchText
		saveSearchedKeys(searchText: searchText)
		feedCollectionViewAdapter?.updateDatasource(dataSource: self.reviewList)
	}
	
	func saveSearchedKeys(searchText: String) {
		if searchText.count > 3 {
			var searches = Dictionary<String, Any>()

			if var popularSearches = UserDefaults.standard.dictionary(forKey: SEARCH_KEYS) {
				if popularSearches[searchText] != nil {
					let updatedValue = (popularSearches[searchText]) as! Int + 1
					popularSearches.updateValue(updatedValue, forKey: searchText)
				} else {
					popularSearches.updateValue(1, forKey: searchText)
				}
				searches = popularSearches
			} else {
				searches.updateValue(1, forKey: searchText)
			}
			UserDefaults.standard.setValue(searches, forKey: SEARCH_KEYS)
		}
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
		self.allReviews = reviews
		self.reviewList = self.allReviews
		self.feedCollectionViewAdapter?.updateDatasource(dataSource: reviewList)
	}
}
extension FeedViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar,textDidChange searchText: String) {
		if searchText.isEmpty {
			self.reviewList = self.allReviews
			feedCollectionViewAdapter?.updateDatasource(dataSource: self.reviewList)
		}
	}
}
extension FeedViewController: UISearchTextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.searchButtonTapped()
		return true
	}
}
