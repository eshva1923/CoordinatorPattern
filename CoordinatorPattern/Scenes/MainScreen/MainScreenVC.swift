//
//  MainScreenVC.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import UIKit
import WebKit

class MainScreenVC: UIViewController, SpecCoordinatedProtocol {
    var name = "MainScreenVC"
    @IBOutlet weak var webview: WKWebView!
    
    var coordinator: SpecCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyCoordinator(SpecEvents.webview.ready)
    }
}

extension MainScreenVC: SpecEventReceiverProtocol, SpecEventInitiatorProtocol {
    func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        if event == SpecEvents.webview.command_loadURL, let desiredURL = payload as? String {
            loadURL(desiredURL)
        }
    }
    
    func notifyCoordinator(_ event: SpecEvent, payload: Any? = nil) {
        guard let myCoordinator = coordinator as? SpecCoordinator else {return}
        sendEvent(event, to: myCoordinator, payload: payload)
    }
    
    func sendEvent(_ event: SpecEvent, to: SpecEventReceiverProtocol, payload: Any?) {
        to.receiveEvent(event, from: self, payload: payload)
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

extension MainScreenVC: WKNavigationDelegate {
    
}
