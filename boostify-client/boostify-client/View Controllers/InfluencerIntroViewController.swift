//
//  InfluencerIntroViewController.swift
//  boostify-client
//
//  Created by Mat Schmid on 2018-06-16.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

class InfluencerIntroViewController: UIViewController {
	
	@IBOutlet weak var platformTableView: UITableView!
	var nextButton: UIBarButtonItem!
	var selectedPlatforms: [Platform: Bool] = [:] {
		didSet {
			shouldShowNext()
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		platformTableView.delegate = self
		platformTableView.dataSource = self
		
		setNeedsStatusBarAppearanceUpdate()
		if let navBar = navigationController?.navigationBar {
			System.clearNavigationBar(forBar: navBar)
			self.navigationController?.view.backgroundColor = UIColor.clear
		}
		
		nextButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(transitionToNextView))
		_ = Platform.allValue.map { selectedPlatforms[$0] = false }
    }
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	private func shouldShowNext() {
		navigationItem.rightBarButtonItem = selectedPlatforms.values.contains(true) ? nextButton : nil
	}
	
	@objc func transitionToNextView() {
		print("NEXT")
	}
}

extension InfluencerIntroViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Platform.allValue.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "platformCell", for: indexPath) as! PlatformTableViewCell
		cell.formatCell(forPlatform: Platform.allValue[indexPath.row])
		cell.selectionStyle = .none
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let platform = Platform.allValue[indexPath.row]
		if let cell = tableView.cellForRow(at: indexPath) as? PlatformTableViewCell, cell.canSelectPlatform(platform) {
			if cell.accessoryType == .none {
				cell.accessoryType = .checkmark
				selectedPlatforms[platform] = true
			} else {
				cell.accessoryType = .none
				selectedPlatforms[platform] = false
				
			}
		}
	}
	
}
