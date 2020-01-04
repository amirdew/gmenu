//
//  MenuItem.swift
//  gmenu
//
//  Created by Amir on 30/11/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation

public protocol MenuItem {
    var id: String { get }
    var title: String { get }
    var imageName: String { get }
    var selectedImageName: String { get }
    var isSelected: Bool { get }
    
    func setSelected()
}

extension Array: Identifiable where Element: MenuItem {
    public var id: String {
        map { $0.id }.joined()
    }
}
