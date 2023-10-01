//
//  WebViewCoordinator.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
import UIKit
import WebKit

class WebViewCoordinator: SpecCoordinator {
    private var webviewVC: MainScreenVC!
    init() {
        super.init(paths: [],
                   name: "WEBVIEW COORDINATOR",
                   coordinated: [],
                   slaves: [])
        //send message to master when ready
    }
    override func start() {
        guard let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainScreenVC") as? MainScreenVC else { fatalError("OH NO") }
        webviewVC = webVC
        //let vc: MainScreenVC & SpecCoordinatedProtocol = mainVC
        webviewVC.coordinator = self
        coordinated.append(webviewVC)
        guard let myMaster = master else { return }
        sendEvent(SpecEvents.coordinator.add_VC, to: myMaster, payload: webviewVC)
        //navigationController?.setViewControllers([vc], animated: false)
        
        //setupPaths()
    }
    
    override func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        if event == SpecEvents.webview.ready {
            sendEvent(SpecEvents.webview.command_loadURL, to: from as! SpecEventReceiverProtocol, payload: "https://web.eshva.net")
        }
    }
}

