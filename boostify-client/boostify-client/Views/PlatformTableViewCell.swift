//
//  PlatformTableViewCell.swift
//  boostify-client
//
//  Created by Mat Schmid on 2018-06-16.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

enum Platform: String {
	case Instagram, Twitter, Youtube, Snapchat
	static let allValue: [Platform] = [.Instagram, .Twitter, .Youtube, .Snapchat]
}

class PlatformTableViewCell: UITableViewCell {

	@IBOutlet weak var platformImageView: UIImageView!
	@IBOutlet weak var platformLabel: UILabel!
	
	func formatCell(forPlatform platform: Platform) {
		platformImageView.image = UIImage(named: platform.rawValue)
		platformLabel.text = platform.rawValue
		
		if !canSelectPlatform(platform) {
			platformLabel.text = platform.rawValue + " (N/A)"
			platformLabel.textColor = UIColor.lightGray
			platformImageView.tintColor = UIColor(named: "Indigo-light")
		}
	}
	
	func canSelectPlatform(_ platform: Platform) -> Bool {
		switch platform {
		case .Instagram:
			return true
		default:
			return false
		}
	}
}

