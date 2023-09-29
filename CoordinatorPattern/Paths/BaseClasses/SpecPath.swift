//
//  SpecPath.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
class SpecPath: SpecPathProtocol {
    var coordinator: SpecCoordinatorProtocol?
    var currentStep: SpecStep?
    var steps: [SpecStep]
    var name: String
    
    func prevStep() -> SpecStep? {
        guard let thisStep = currentStep, (steps.count > 0 && thisStep != steps.first) else {return nil}
        return steps.item(before: thisStep)
    }
    func nextStep() -> SpecStep? {
        guard steps.count > 0 else {return nil}
        guard let thisStep = currentStep else { return steps.first }
        return thisStep == steps.last ? nil : steps.item(after: thisStep)
    }
    
    init(name: String, steps: [SpecStep], currentStep: SpecStep? = nil, coordinator: SpecCoordinatorProtocol?) {
        self.name = name
        self.steps = steps
        self.currentStep = currentStep
        self.coordinator = coordinator
    }
    func forward() -> ActionResult {
        guard let next = nextStep() else { return .ActionFailed }
        guard next.execute() == .ActionOK else { return .ActionFailed }
        currentStep = next
        return .ActionOK
    }
    
    func automatic(callback: ((PathResult) -> Void)? = nil) {
        for _ in steps {
            guard forward() == .ActionOK else {
                if let callback = callback { callback(.PathFailed) }
                return
            }
        }
        if let callback = callback { callback(.PathOk) }
    }
}
