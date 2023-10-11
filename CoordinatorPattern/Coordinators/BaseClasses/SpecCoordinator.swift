//
//  SpecCoordinator.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
import UIKit

class SpecCoordinator: SpecCoordinatorProtocol, SpecEventInitiatorProtocol, SpecEventReceiverProtocol {
    var paths: [SpecPath]
    var name: String
    var coordinated: [SpecCoordinatedProtocol]
    weak var master: SpecCoordinator?
    var slaves: [SpecCoordinator]
    
    init(paths: [SpecPath], name: String, coordinated: [SpecCoordinatedProtocol], master: SpecCoordinator? = nil, slaves: [SpecCoordinator]) {
        self.paths = paths
        self.name = name
        self.coordinated = coordinated
        self.master = master
        self.slaves = slaves
    }
    
    func addSlave(_ newSlave: SpecCoordinator) {
        newSlave.setMaster(self)
        slaves.append(newSlave)
    }
    
    func setMaster(_ newMaster: SpecCoordinator) {
        master = newMaster
    }
    func start() {
        fatalError("ERROR: implement \(#function)")
    }
    func done() {
        guard let myMaster = master else {return}
        sendEvent(SpecEvents.coordinator.finished, to: myMaster, payload: self)
    }
    
    func startPath(_ path: SpecPath) {
        fatalError("ERROR: implement \(#function)")
    }

    func coordinatedDidFinish(_ coordinatedVC: SpecCoordinatedProtocol) {
        for (index, thisVC) in coordinated.enumerated() {
            if thisVC === coordinatedVC {
                coordinated.remove(at: index)
            }
        }
    }


    func sendEvent(_ event: SpecEvent, to: SpecEventReceiverProtocol, payload: Any?) {
        to.receiveEvent(event, from: self, payload: payload)
    }
    
    func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        print ("event received: \(event)")
        fatalError("ERROR: implement \(#function)")
    }
    
}
