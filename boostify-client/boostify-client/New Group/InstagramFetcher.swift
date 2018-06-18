//
//  InstagramFetcher.swift
//  boostify-client
//
//  Created by Mat Schmid on 2018-06-17.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import Foundation

struct InstagramFetcher {
	static let authURL = "https://api.instagram.com/oauth/authorize/"
	static let clientID = "af496871eec9400287ea6baf8226a31b"
	static let clientSecret = "281e7889d9fa4c09953c7e9edc1aeb61"
	static let redirectURI = "http://matschmid.me/"
	static let scope = "basic+public_content"
	
	static func generateAuthURL() -> String {
		return "https://api.instagram.com/oauth/authorize/?client_id=\(clientID)&redirect_uri=\(redirectURI)&response_type=token&scope=\(scope)&DEBUG=True"
	}
}
