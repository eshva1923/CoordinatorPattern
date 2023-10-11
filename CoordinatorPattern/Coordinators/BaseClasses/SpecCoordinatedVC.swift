//
//  SpecCoordinatedVC.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 01/10/2023.
//

import Foundation
import UIKit

class SpecCoordinatedVC: UIViewController, SpecCoordinatedProtocol, Storyboarded, SpecEventInitiatorProtocol, SpecEventReceiverProtocol {
    func sendEvent(_ event: SpecEvent, to: SpecEventReceiverProtocol, payload: Any?) {
        to.receiveEvent(event, from: self, payload: payload)
    }
    
    func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?) {
        print("event received \(event)")
    }
    
    var coordinator: SpecCoordinator?
    
    func notifyCoordinator(_ event: SpecEvent, payload: Any?) {
        coordinator?.receiveEvent(event, from: self, payload: payload)
    }
    
    func didFinish() {
        notifyCoordinator(SpecEvents.coordinatedVC.finished, payload: nil)
    }
    
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    

    
}
