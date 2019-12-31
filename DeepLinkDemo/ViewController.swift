//
//  ViewController.swift
//  deepLink
//
//  Created by Vaibhav on 30/12/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import UIKit
import WebKit

class Values : NSObject {
    static let domain           =   "https://test.paydollar.com/b2cDemo"
    static let secureHash       =   ""
    static let amount           =   "0.1"
    static let currCode         =   "344"
    static let payType          =   "N"
    static let orderRef         =   "123456"
    static let merchantId       =   "123456"
    static let extra            =   ""
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var wkWeb: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wkWeb.uiDelegate = self
        wkWeb.navigationDelegate = self
        self.call(nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func call(_ sender: Any?) {
        let str = Values.domain + "/eng/payment/payForm.jsp?" + "secureHash=" + Values.secureHash + "&amount=" + Values.amount + "&currCode=" + Values.currCode + "&payType=N&orderRef=" + Values.orderRef + "&merchantId=" + Values.merchantId + Values.extra
        
        wkWeb.load(URLRequest(url: URL(string:str)!))
        //UIApplication.shared.open(URL(string:str)!, options: [:], completionHandler: nil)
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.daledietrich.com"]];
        
        //        UIApplication.shared.open(URL.init(string: "weixin://")!, options: [:], completionHandler: nil)
        //        UIApplication.shared.open(URL(string: "com.whatswhatsapp://")!, options: [:], completionHandler: nil)
    }
    
}

extension ViewController : WKNavigationDelegate {
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
        print(navigationAction.request.url!)
        //if navigationAction.navigationType == .linkActivated  {
        if let url = navigationAction.request.url,
            "https" != navigationAction.request.url?.scheme,
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:]) { (res) in
                print(res)
            }
            decisionHandler(.cancel,WKWebpagePreferences.init())
        } else {
            decisionHandler(.allow,WKWebpagePreferences.init())
        }
        //decisionHandler(.allow, WKWebpagePreferences.init())
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let credential = URLCredential(user: "user", password: "password", persistence: URLCredential.Persistence.forSession)
        completionHandler(.performDefaultHandling, credential)
    }
    
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) { }
}



extension ViewController : WKUIDelegate {
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return webView
        
    }
    
    
    func webViewDidClose(_ webView: WKWebView) { }
    
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) { }
    
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) { }
    
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) { }
    
    
    @available(iOS 13.0, *)
    private func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKContextMenuElementInfo) -> Bool {
        return true
    }
    
    
    @available(iOS 13.0, *)
    private func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKContextMenuElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
        return self
    }
    
    
    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) { }
    
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo, completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
        completionHandler(.none)
    }
    
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuWillPresentForElement elementInfo: WKContextMenuElementInfo) { }
    
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuForElement elementInfo: WKContextMenuElementInfo, willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating) { }
    
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, contextMenuDidEndForElement elementInfo: WKContextMenuElementInfo) { }
}
