//
//  WebViewController.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit
import WebKit
class WebViewModel{
    var article:ArticleModel?
    
    
}
class WebViewController : BaseViewController {
    
    @IBOutlet weak var webView:WKWebView!
    var viewModel:WebViewModel? = WebViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.navigationDelegate = self
        guard let url = viewModel?.article?.url else {
            return
        }
        let request =  URLRequest(url: url)
        self.webView.load(request)
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.utility?.alert?.showMessage(text: "Cancel Operation", title: "!!!!", defaultbutton: "Ok", cancelbutton: "Cancel",callback:{ (index) in
          if index  == 0 {
                self.webView.stopLoading()
                self.navigationController?.popViewController(animated: true)
            }
        })
       
    
}
}
extension WebViewController:WKNavigationDelegate{
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        
        self.utility?.activity?.showHud(inView: self.webView)
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        self.utility?.activity?.hide()
        
    }
}
