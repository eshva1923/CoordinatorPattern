//
//  SpecEventProtocol.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
protocol SpecEventInitiatorProtocol {
    func sendEvent(_ event: SpecEvent, to: SpecEventReceiverProtocol, payload: Any?)
    //func broadcastEvent(_ event: SpecEvents, direction: EventPropagationDirection, callback: (()->Void)?)
}
protocol SpecEventReceiverProtocol {
    func receiveEvent(_ event: SpecEvent, from: SpecEventInitiatorProtocol, payload: Any?)
}
