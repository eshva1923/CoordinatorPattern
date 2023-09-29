//
//  BidirectionalCollection+Extensions.swift
//  CoordinatorPattern
//
//  Created by Federico Brandani on 29/09/2023.
//

import Foundation

extension BidirectionalCollection where Iterator.Element: Equatable {
    typealias Element = Self.Iterator.Element
    func safeIndex(before index: Index) -> Index? {
        let previousIndex = self.index(before: index)
        return (self.startIndex <= previousIndex) ? previousIndex : nil
    }
    func index(beforeWithWrapAround index: Index) -> Index {
        return self.safeIndex(before: index) ?? self.index(before: self.endIndex)
    }
    func item(before item: Element) -> Element? {
        return self.firstIndex(of: item)
            .flatMap(self.safeIndex(before:))
            .map{ self[$0] }
    }
    func item(beforeWithWrapAround item: Element) -> Element? {
        return self.firstIndex(of: item)
            .map(self.index(beforeWithWrapAround:))
            .map{ self[$0] }
    }
}
