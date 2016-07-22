//
//  DefaultWebViewController.swift
//  PullToRefreshKit
//
//  Created by huangwenchen on 16/7/22.
//  Copyright © 2016年 Leo. All rights reserved.
//

import Foundation
import UIKit

class DefaultWebViewController: UIViewController,UIWebViewDelegate{
    var webview:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview = UIWebView(frame:view.bounds)
        self.webview.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
        self.webview.backgroundColor = UIColor.whiteColor()
        view.addSubview(self.webview)
        self.webview.scrollView.setUpHeaderRefresh({ [weak self] in
            if self?.webview.request != nil{
                self?.webview.reload()
            }else{
                let url = NSURL(string: "https://www.baidu.com")
                let request = NSURLRequest(URL: url!)
                self?.webview.loadRequest(request)
            }
        })
        let url = NSURL(string: "https://www.baidu.com")
        let request = NSURLRequest(URL: url!)
        self.webview.loadRequest(request)
        self.webview.delegate = self
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        self.webview.scrollView.endHeaderRefreshing()
    }
}