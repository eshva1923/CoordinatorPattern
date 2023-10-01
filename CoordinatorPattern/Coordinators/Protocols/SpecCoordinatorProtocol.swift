//
//  SpecCoordinatorProtocol.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation

protocol SpecCoordinatorProtocol {
    var paths: [SpecPath] {get set}
    var name: String {get set}
    //var navigationController: UINavigationController? {get set}
    var coordinated: [SpecCoordinatedProtocol] {get set}
    var master: SpecCoordinator? {get set}
    var slaves: [SpecCoordinator] {get}
    
    //func eventReceived(_ event: SpecEvent)
    //func eventSend(_ event: SpecEvent, to: SpecCoordinatedProtocol)
    //func eventBroadcast(_ event: SpecEvent)
    func start()
    func setMaster(_ newMaster: SpecCoordinator)
    //
    func startPath(_ path: SpecPath)
    //func setupPaths()
}
