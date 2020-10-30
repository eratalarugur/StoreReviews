//
//  FeedPostCell.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation
import UIKit

class FeedPostCell: UICollectionViewCell {

	var review: ReviewApplicationModel?
	
	// MARK: - UIComponents
	var bigContainer: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 20.0
		view.backgroundColor = .white
		return view
	}()
	var versionInfoLabel: UILabel = {
		let label = UILabel()
		label.textColor = .secondaryLabel
		label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
		label.textAlignment = .right
		return label
	}()
	var usernameLabel: UILabel = {
		let label = UILabel()
		label.textColor = .secondaryLabel
		label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
		label.textAlignment = .right
		return label
	}()
	var feedTitleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .label
		label.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
		label.textAlignment = .left
		return label
	}()
	var feedDescriptionLabel: UILabel = {
		let label = UILabel()
		label.textColor = .label
		label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
		label.textAlignment = .left
		label.numberOfLines = 3
		return label
	}()
	var ratingLabel: UILabel = {
		let label = UILabel()
		return label
	}()
	
	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup
	func setupUI() {
		//** bigContainer
		addSubview(bigContainer)
		bigContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: 0, height: 0)
		
		//** versionInfoLabel
		bigContainer.addSubview(versionInfoLabel)
		versionInfoLabel.anchor(top: bigContainer.topAnchor, left: nil, bottom: nil, right: bigContainer.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0, height: 20)
		
		//** usernameLabel
		bigContainer.addSubview(usernameLabel)
		usernameLabel.anchor(top: versionInfoLabel.bottomAnchor, left: nil, bottom: nil, right: bigContainer.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0, height: 10)

		//** feedTitleLabel
		bigContainer.addSubview(feedTitleLabel)
		feedTitleLabel.anchor(top: bigContainer.topAnchor, left: bigContainer.leftAnchor, bottom: nil, right: versionInfoLabel.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)

		//** ratingLabel
		bigContainer.addSubview(ratingLabel)
		ratingLabel.anchor(top: feedTitleLabel.bottomAnchor, left: bigContainer.leftAnchor, bottom: nil, right: usernameLabel.leftAnchor, paddingTop: 8, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 10)

		//** feedDescriptionLabel
		bigContainer.addSubview(feedDescriptionLabel)
		feedDescriptionLabel.anchor(top: ratingLabel.bottomAnchor, left: bigContainer.leftAnchor, bottom: nil, right: bigContainer.rightAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0)
	}
	
	func configure(with review: ReviewApplicationModel) {
		self.review = review
		versionInfoLabel.text = self.review?.version
		usernameLabel.text = self.review?.username
		feedTitleLabel.text = self.review?.reviewTitle
		ratingLabel.text = self.review?.rating
		feedDescriptionLabel.text = self.review?.reviewDescription
	}
}
