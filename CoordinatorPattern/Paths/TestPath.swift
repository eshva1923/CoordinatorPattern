//
//  TestPath.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
class TestPath: SpecPath {
    private override init(name: String, steps: [SpecStep], currentStep: SpecStep? = nil, coordinator: SpecCoordinatorProtocol?) {
        super.init(name: "TESTPATH", steps: steps, currentStep: currentStep, coordinator: coordinator)
    }
    init(coordinator: SpecCoordinatorProtocol? = nil) {
        super.init(name: "TEST", steps: [
            SpecStep(name: "step one", executableAction: { print("executing step one"); return .ActionOK }),
            SpecStep(name: "step two", executableAction: {
                print("loading a website");
                coordinator?.eventReceived(.webview_loadTheWebsite)
                return .ActionOK }),
            SpecStep(name: "step three", executableAction: { print("executing step three"); return .ActionOK })
        ], coordinator: coordinator)
    }
}
