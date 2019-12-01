//
//  MenuItemView.swift
//  gmenu
//
//  Created by Amir on 30/11/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI

struct MenuItemView: View {
    
    var item: MenuItem
    var isExpanded: Bool = true
    var width: CGFloat = 90
    var height: CGFloat = 70
    var onTap: (() -> Void)? = nil
    
    private var animationIn: Animation {
        Animation
            .spring(dampingFraction: 0.7)
            .speed(1.5)
            .delay(0.01 * Double(item.index))
    }
    
    private var animationOut: Animation {
        Animation
            .spring()
            .speed(1.9)
    }
    
    private var showSelected: Bool {
        item.isSelected && isExpanded
    }
    
    private var backgroundColor: Color {
        return isExpanded ? (showSelected ? Color("menuTextSelectedBackground") : Color.clear) : Color("menuDots")
    }
    
    var body: some View {
        VStack {
            Image(showSelected ? item.selectedImageName : item.imageName)
            Text(item.title)
                .font(.menu)
                .foregroundColor(showSelected ? Color("menuTextSelected") : Color("menuText"))
                .opacity(isExpanded ? 1 : 0)
                .frame(width: width)
        }
        .scaleEffect(x: isExpanded ? 1 : 0, y: isExpanded ? 1 : 0)
        .frame(width: isExpanded ? width : 5, height: isExpanded ? height : 5)
        .background(backgroundColor)
        .cornerRadius(isExpanded ? 10 : 1)
        .animation(isExpanded ? animationIn : animationOut)
        .onTapGesture {
            self.onTap?()
        }
    }
}

private extension Font {
    static var menu: Font {
        return system(size: 15, weight: .semibold, design: .default)
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(
            item: MenuItem(index: 0,
                           title: "Inbox",
                           imageName: "inboxIcon",
                           selectedImageName: "inboxIconRed")
        )
    }
}
