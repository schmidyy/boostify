//
//  WebModalViewController.swift
//  boostify-client
//
//  Created by Mat Schmid on 2018-06-17.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit
import WebKit

protocol WebModalDelegate: class {
	func didReceiveInstagramAccessToken(token: String)
}

class WebModalViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var headerView: UIView!
	@IBOutlet weak var webView: WKWebView!
	
	weak var delegate: WebModalDelegate?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setNeedsStatusBarAppearanceUpdate()
		
		webView.uiDelegate = self
		webView.navigationDelegate = self
		loadInstagramAuth()
    }
	
	func loadInstagramAuth() {
		let authURL = "https://api.instagram.com/oauth/authorize/?client_id=\(Instagram.clientID)&redirect_uri=\(Instagram.redirectURI)&response_type=token&scope=\(Instagram.scope)&DEBUG=True"
		let urlRequest = URLRequest(url: URL(string: authURL)!)
		webView.load(urlRequest)
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	@IBAction func cancelButtonTapped(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
	
	func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
		guard let url = webView.url?.absoluteString else { return }
		if url.contains("matschmid.me") {
			if let range = url.range(of: "#access_token=") {
				let accessToken = url[range.upperBound...]
				delegate?.didReceiveInstagramAccessToken(token: String(accessToken))
				dismiss(animated: true, completion: nil)
			}
		}
	}
}

struct Instagram {
	static let authURL = "https://api.instagram.com/oauth/authorize/"
	static let clientID = "af496871eec9400287ea6baf8226a31b"
	static let clientSecret = "281e7889d9fa4c09953c7e9edc1aeb61"
	static let redirectURI = "http://matschmid.me/"
	static let scope = "basic+public_content"
}
