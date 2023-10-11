//
//  MainScreenVC.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 01/10/2023.
//

import Foundation
import UIKit
import WebKit

class MainScreenVC: SpecCoordinatedVC {
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyCoordinator(SpecEvents.webview.ready, payload: self)
    }
    
    override func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        if event == SpecEvents.webview.command_loadURL {
            if let urlString = payload as? String {
                loadURL(urlString)
            } else if let url = payload as? URL {
                loadURL(url)
            }
            else { return }
        }
    }
}

extension MainScreenVC {
    func loadURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { /*notifyCoordinator(.navigationError_malformedURL); */return}
        loadURL(url)
    }
    func loadURL(_ url: URL) {
        loadRequest(URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10))
    }
    private func loadRequest(_ urlReq: URLRequest) {
        webview.load(urlReq)
    }
}
