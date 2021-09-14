//
//  DetailViewController.swift
//  project7
//
//  Created by wahid tariq on 14/09/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        guard let detailItem = detailItem else{return}
            
        let html = """
            <html>
            <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style> body {font-size: 150%; } </style>
            </head>
            <body>
            \(detailItem.body)
            </body>
            </html>
            """

        webView.loadHTMLString(html, baseURL: nil)
    }
    


}
