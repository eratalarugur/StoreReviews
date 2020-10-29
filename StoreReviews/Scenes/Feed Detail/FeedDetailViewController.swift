//
//  FeedDetailViewController.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 28.10.2020.
//

import Foundation
import UIKit

protocol FeedDetailViewControllerProtocol: BaseViewControllerProtocol {
}

class FeedDetailViewController: BaseViewController, FeedDetailViewControllerProtocol {
	
	// MARK: - UI Components -
	var topContainer: UIView = {
		let view = UIView()
		view.backgroundColor = .systemGroupedBackground
		return view
	}()
	
	var sceneTitleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .label
		label.textAlignment = .center
		label.sizeToFit()
		return label
	}()
	
	var closeButton: UIButton = {
		let button = UIButton(type: .system)
		button.setImage(UIImage(systemName: "xmark.circle")?.withRenderingMode(.alwaysOriginal), for: .normal)
		button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
		return button
	}()
	
	var usernameLabel: UILabel = {
		let label = UILabel()
		label.textColor = .secondaryLabel
		label.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
		label.textAlignment = .right
		label.sizeToFit()
		return label
	}()
	
	var versionInfoLabel: UILabel = {
		let label = UILabel()
		label.textColor = .secondaryLabel
		label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
		label.textAlignment = .right
		label.sizeToFit()
		return label
	}()
	
	var titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .label
		label.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
		label.textAlignment = .left
		label.numberOfLines = 2
		label.sizeToFit()
		return label
	}()
	
	var descriptionLabel: UILabel = {
		let label = UILabel()
		label.textColor = .label
		label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
		label.numberOfLines = 0
		return label
	}()
	
	// MARK: - Properties
	var sceneTitle: String? {
		didSet {
			sceneTitleLabel.text = sceneTitle
		}
	}
	var review: ReviewApplicationModel?
	var interactor: FeedDetailInteractorProtocol?
	
	// MARK: - Lifecycle -
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		setup()
	}
	
	// MARK: - Setup -
	func setup() {
		let interactor = FeedDetailInteractor()
		let presenter = FeedDetailPresenter()
		presenter.viewController = self
		interactor.presenter = presenter
		self.interactor = interactor
		configureView()
	}
	
	func configureView() {
		//** topContainer
		self.view.addSubview(topContainer)
		topContainer.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
		
		//** closeButton
		topContainer.addSubview(closeButton)
		closeButton.anchor(top: topContainer.topAnchor, left: nil, bottom: topContainer.bottomAnchor, right: topContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 40, height: 0)
		
		//** sceneTitleLabel
		topContainer.addSubview(sceneTitleLabel)
		sceneTitleLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 40)
		sceneTitleLabel.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
		sceneTitleLabel.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
		
		//** usernameLabel
		self.view.addSubview(usernameLabel)
		usernameLabel.anchor(top: topContainer.bottomAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)

		//** versionInfoLabel
		self.view.addSubview(versionInfoLabel)
		versionInfoLabel.anchor(top: usernameLabel.bottomAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
 
		//** titleLabel
		self.view.addSubview(titleLabel)
		titleLabel.anchor(top: topContainer.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: usernameLabel.leftAnchor, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)

		//** descriptionLabel
		self.view.addSubview(descriptionLabel)
		descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
		
		if let reviewObj = self.review {
			usernameLabel.text = reviewObj.username
			versionInfoLabel.text = reviewObj.version
			titleLabel.text = review?.reviewTitle
			sceneTitle = String(repeating: "⭐️", count: Int(reviewObj.rating) ?? 0)
			descriptionLabel.text = reviewObj.reviewDescription
		}
	}
	
	@objc func dismissVC() {
		dismiss(animated: true, completion: nil)
	}
}
