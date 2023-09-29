//
//  File.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
import UIKit

protocol SpecPathProtocol {
    var coordinator: SpecCoordinatorProtocol? {get set}
    var name: String {get set}
    var steps: [SpecStep] {get set}
    var currentStep: SpecStep? {get set}
    func prevStep() -> SpecStep?
    func nextStep() -> SpecStep?
    func forward() -> ActionResult
    func automatic(callback: ((PathResult) -> Void)?)
}
enum PathResult {
    case PathFailed
    case PathOk
}


