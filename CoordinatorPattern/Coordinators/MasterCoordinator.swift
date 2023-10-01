//
//  MasterCoordinator.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
import UIKit

class MasterCoordinator: SpecCoordinator {
    private static var navigationController = UINavigationController()
    static let shared = MasterCoordinator(paths: [], name: "MASTER", coordinated: [], master: nil, slaves: [])
    static func getNavigationController() -> UINavigationController { navigationController }
    
    private override init(paths: [SpecPath], name: String, coordinated: [SpecCoordinatedProtocol], master: SpecCoordinator? = nil, slaves: [SpecCoordinator]) {
        super.init(paths: [],
                   name: "MASTER",
                   coordinated: [],
                   master: nil,
                   slaves: [])
        configure()
    }
    private func configure() {
        addSlave(WebViewCoordinator())
    }
    override func start() {
        print("master started")
        for slave in self.slaves {
            slave.start()
        }
    }
    
    override func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        if event == SpecEvents.coordinator.add_VC {
            guard let vc = payload as? UIViewController else {return}
            var newNavControllerStack = MasterCoordinator.navigationController.viewControllers
            newNavControllerStack.append(vc)
            MasterCoordinator.navigationController.setViewControllers(newNavControllerStack, animated: false)
        }
    }
}

