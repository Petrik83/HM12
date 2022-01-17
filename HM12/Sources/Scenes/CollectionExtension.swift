//
//  CollectionExtension.swift
//  HM12
//
//  Created by Александр Петрович on 16.01.2022.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
