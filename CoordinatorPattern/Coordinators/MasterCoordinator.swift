//
//  MasterCoordinator.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
import UIKit

class MasterCoordinator: SpecCoordinatorProtocol {
    var paths: [SpecPath] = []
    
    var coordinated: [SpecCoordinatedProtocol] = []
    
    var name = "MASTER"
    var navigationController: UINavigationController?
    
    
    private var mainVCSpawned = false
    
    func eventReceived(_ event: SpecEvent) {
        switch event {
        case .coordinated_spawned:
            guard mainVCSpawned == false else { return }
            mainVCSpawned = true
            let testpath = paths.first { $0.name == "TEST" }
            guard let tp = testpath else { return }
            startPath(tp)
        case .webview_loadTheWebsite:
            let webviewController = coordinated.first { $0.name == "MainScreenVC" }
            guard let vc = webviewController as? MainScreenVC else {return}
            vc.loadURL("https://web.eshva.net")
        default:
            print("eh")
        }
    }
    
    func startPath(_ path: SpecPath) {
        path.automatic { result in
            dump(result)
        }
    }
    
    func start() {
        guard let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainScreenVC") as? MainScreenVC else {
            fatalError("OH NO")
        }
        let vc: MainScreenVC & SpecCoordinatedProtocol = mainVC
        vc.coordinator = self
        coordinated.append(vc)
        navigationController?.setViewControllers([vc], animated: false)
        
        setupPaths()
    }
    
    func setupPaths() {
        paths.append(TestPath(coordinator: self))
    }
    
    
}
