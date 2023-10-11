//
//  WebViewCoordinator.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
import UIKit
import WebKit

class MainScreenCoordinator: SpecCoordinator {
    //private var webviewVC: MainScreenVC!
    init() {
        super.init(paths: [],
                   name: "WEBVIEW COORDINATOR",
                   coordinated: [],
                   slaves: [])
        //send message to master when ready
    }
    override func start() {
        addCoordinatedViewController(withName: "MainScreenVC")
        
        //setupPaths()
    }
    override func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        if event == SpecEvents.webview.ready {
            sendEvent(SpecEvents.webview.command_loadURL, to: from as! SpecEventReceiverProtocol, payload: "https://web.eshva.net")
        }
    }
}


extension MainScreenCoordinator {
    private func addCoordinatedViewController(withName name: String) {
        guard let myMaster = master else { return }
        guard let vcToAdd = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name) as? MainScreenVC else { fatalError("OH NO") }
        vcToAdd.coordinator = self
        coordinated.append(vcToAdd)
        sendEvent(SpecEvents.coordinator.add_VC, to: myMaster, payload: vcToAdd)
    }
}
