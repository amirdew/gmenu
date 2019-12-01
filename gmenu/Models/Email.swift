//
//  Email.swift
//  gmenu
//
//  Created by Amir on 30/11/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation

struct Email: Identifiable {
    let id = UUID()
    let sender: String
    let time: String
    let title: String
    let description: String
}
