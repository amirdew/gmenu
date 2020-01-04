//
//  Array+chunked.swift
//  gmenu
//
//  Created by Amir Khorsandi on 1/2/20.
//  Copyright © 2020 Amir. All rights reserved.
//

import Foundation

extension Array {
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    func filledWith(_ element: Element, max: Int) -> Self {
        var newArray = self
        if count < max {
            newArray.append(contentsOf: Array(repeating: element, count: max - count))
        }
        return newArray
    }
}
