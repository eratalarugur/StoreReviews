//
//  BaseViewController.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol: class {
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
	
	override func viewDidLoad() {
		self.view.backgroundColor = .systemGroupedBackground
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationItem.largeTitleDisplayMode = .always
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}
