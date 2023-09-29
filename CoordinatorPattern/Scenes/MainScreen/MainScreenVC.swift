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
    func notifyCoordinator(_ event: SpecEvent) {
        guard let myCoordinator = coordinator else { fatalError() }
        myCoordinator.eventReceived(event)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyCoordinator(.coordinated_spawned)
    }
}

extension MainScreenVC {
    func loadURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { notifyCoordinator(.navigationError_malformedURL); return}
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
