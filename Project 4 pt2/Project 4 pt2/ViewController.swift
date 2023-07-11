//
//  ViewController.swift
//  Project 4 pt2
//
//  Created by Ivayla  Panayotova on 11.07.23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2021/12/30151747/Pembroke-Welsh-Corgi-smiling-and-happy-outdoors.jpeg")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}

