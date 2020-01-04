//
//  DefaultMenuItem.swift
//  gmenu
//
//  Created by Amir Khorsandi on 1/4/20.
//  Copyright © 2020 Amir. All rights reserved.
//

import Foundation

struct DefaultMenuItem: MenuItem {
    let id = UUID().uuidString
    let title: String
    let imageName: String
    let selectedImageName: String
}


extension DefaultMenuItem {
    static var empty: DefaultMenuItem {
        DefaultMenuItem(title: "", imageName: "", selectedImageName: "")
    }
}
