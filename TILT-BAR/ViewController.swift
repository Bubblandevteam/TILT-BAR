//
//  ViewController.swift
//  TILT BAR
//
//  Created by Evilism on 28/10/2021.
//

import UIKit
import WebKit
import AppTrackingTransparency
import AdSupport

func requestIDFA() {
  ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
    // Tracking authorization completed. Start loading ads here.
    // loadAd()
  })
}
func requestPermission() {
    if #available(iOS 14, *) {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                // Tracking authorization dialog was shown
                // and we are authorized
                print("Authorized")
                
                // Now that we are authorized we can get the IDFA
                print(ASIdentifierManager.shared().advertisingIdentifier)
            case .denied:
                // Tracking authorization dialog was
                // shown and permission is denied
                print("Denied")
            case .notDetermined:
                // Tracking authorization dialog has not been shown
                print("Not Determined")
            case .restricted:
                print("Restricted")
            @unknown default:
                print("Unknown")
            }
        }
    }
}
class ViewController: UIViewController {
    var scrollView: UIScrollView?
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        let webView = WKWebView(frame: view.frame)
                view.addSubview(webView)
                
                let url = URL(string: "https://www.tiltbar.se/")!
                let request = URLRequest(url: url)
                webView.load(request)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}

