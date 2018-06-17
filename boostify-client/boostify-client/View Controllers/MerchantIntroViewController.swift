//
//  MerchantIntroViewController.swift
//  boostify-client
//
//  Created by Mat Schmid on 2018-06-16.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

class MerchantIntroViewController: UIViewController {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setNeedsStatusBarAppearanceUpdate()
		if let navBar = navigationController?.navigationBar {
			System.clearNavigationBar(forBar: navBar)
			self.navigationController?.view.backgroundColor = UIColor.clear
		}
    }
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

}
