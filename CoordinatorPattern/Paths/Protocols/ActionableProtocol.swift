//
//  ActionableProtocol.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
protocol Actionable {
    var executableAction: () -> (ActionResult) {get set}
    func execute() -> ActionResult
}

enum ActionResult {
    case ActionOK
    case ActionFailed
}
