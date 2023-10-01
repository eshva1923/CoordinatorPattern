//
//  SpecCoordinatedProtocol.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
protocol SpecCoordinatedProtocol {
    var coordinator: SpecCoordinatorProtocol? {get set}
    var name: String {get set}
    func notifyCoordinator(_ event: SpecEvent, payload: Any?)
}
