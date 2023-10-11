//
//  MainScreenVC.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import UIKit
import WebKit

class OLDMainScreenVC: UIViewController, SpecCoordinatedProtocol {
    var name = "MainScreenVC"
    @IBOutlet weak var webview: WKWebView!
    
    var coordinator: SpecCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyCoordinator(SpecEvents.webview.ready)
    }
    
    func didFinish() {
        notifyCoordinator(SpecEvents.coordinator.finished)
    }
}

extension OLDMainScreenVC: SpecEventReceiverProtocol, SpecEventInitiatorProtocol {
    func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        if event == SpecEvents.webview.command_loadURL, let desiredURL = payload as? String {
            loadURL(desiredURL)
        }
    }
    func notifyCoordinator(_ event: SpecEvent, payload: Any? = nil) {
        sendEvent(event, to: coordinator!, payload: payload)
    }
    
    func sendEvent(_ event: SpecEvent, to: SpecEventReceiverProtocol, payload: Any?) {
        to.receiveEvent(event, from: self, payload: payload)
    }
}

extension OLDMainScreenVC {
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
