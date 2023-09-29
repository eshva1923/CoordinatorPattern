//
//  SpecStep.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
class SpecStep: Actionable, Equatable {
    var executableAction: () -> (ActionResult)
    let name: String
    
    func execute() -> ActionResult {
        executableAction()
    }
    static func == (lhs: SpecStep, rhs: SpecStep) -> Bool {
        lhs.name == rhs.name
    }
    init(name: String, executableAction: @escaping () -> ActionResult) {
        self.executableAction = executableAction
        self.name = name
    }
}
