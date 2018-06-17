//
//  WelcomeViewController.swift
//  boostify-client
//
//  Created by Mat Schmid on 2018-06-16.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

	@IBOutlet weak var userButtonStackView: UIStackView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setNeedsStatusBarAppearanceUpdate()
		configureScreenElements()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .default
	}
	
	private func configureScreenElements() {
		for button in userButtonStackView.arrangedSubviews {
			button.layer.cornerRadius = 6
		}
	}
}
