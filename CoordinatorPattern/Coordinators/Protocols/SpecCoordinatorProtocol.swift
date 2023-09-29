//
//  SpecCoordinatorProtocol.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
import UIKit

enum SpecEvent {
    case buttonTapped
    case navigationError_malformedURL
    case coordinated_spawned
    case webview_loadTheWebsite
}
protocol SpecCoordinatorProtocol {
    var paths: [SpecPath] {get set}
    var name: String {get set}
    var navigationController: UINavigationController? {get set}
    var coordinated: [SpecCoordinatedProtocol] {get set}
    
    func eventReceived(_ event: SpecEvent)
    func start()
    func startPath(_ path: SpecPath)
    func setupPaths()
}

protocol SpecCoordinatedProtocol {
    var coordinator: SpecCoordinatorProtocol? {get set}
    var name: String {get set}
    func notifyCoordinator(_ event: SpecEvent)
}
