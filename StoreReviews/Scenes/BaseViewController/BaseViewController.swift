//
//  BaseViewController.swift
//  StoreReviews
//
//  Created by Ugur Eratalar on 25.10.2020.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol: class {
	func showError(text: String)
}

class BaseViewController: UIViewController {
	
	override func viewDidLoad() {
		self.view.backgroundColor = .systemGroupedBackground
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationItem.largeTitleDisplayMode = .always
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}

extension BaseViewController: BaseViewControllerProtocol {
	func showError(text: String) {
		let alert = UIAlertController(title: ERROR_TITLE, message: text, preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: ERROR_BUTTON_TITLE, style: UIAlertAction.Style.cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
}
