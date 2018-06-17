//
//  System.swift
//  boostify-client
//
//  Created by Mat Schmid on 2018-06-16.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

struct System {
	static func clearNavigationBar(forBar navBar: UINavigationBar) {
		navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navBar.shadowImage = UIImage()
		navBar.isTranslucent = true
	}
}
