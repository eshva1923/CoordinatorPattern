//
//  Storyboarded.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 01/10/2023.
//

import Foundation
import UIKit

protocol Storyboarded: UIViewController {
    static func instantiate() -> Self
    //var storyboardName: String {get}
}
