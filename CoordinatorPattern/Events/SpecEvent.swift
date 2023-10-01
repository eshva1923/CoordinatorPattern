//
//  SpecEvent.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation
typealias SpecEvent = String

struct SpecEvents {
    struct webview {
        static let command_loadURL = "webview_command_loadURL"
        static let command_stopLoading = "webview_command_stopLoading"
        static let ready = "webview_ready"
    }
    struct coordinator {
        static let ready = "coordinator_ready"
        static let added = "coordinator_added"
        static let add_VC = "coordinator_add_VC"
    }
}
