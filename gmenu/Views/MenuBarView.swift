//
//  MenuBarView.swift
//  gmenu
//
//  Created by Amir on 01/12/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI
import UIKit

struct MenuBarView: View {
    
    var isOpen: Bool = false
    var menuItems: [MenuItem]
    var onToggle: (() -> Void)?
    
    private let itemWidth: CGFloat = 90
    private let horizontalPadding: CGFloat = 16
    
    private var animation: Animation {
        Animation
            .spring(dampingFraction: 0.85)
            .speed(1.5)
    }
    
    private var menuVerticalGapSize: CGFloat {
        min(menuHorizontalGapSize * 4.8, 28)
    }
    
    private var menuHorizontalGapSize: CGFloat {
        let size = min(35, (UIScreen.main.bounds.width - (itemWidth * 3) - (horizontalPadding * 2))/4)
        return isOpen ? size : 3
    }
    
    var body: some View {
        ZStack(alignment: isOpen ? .center : .leading) {
            Color("cardBackground")
            
            HStack {
                Text("Search email")
                    .foregroundColor(Color("text"))
                    .scaleEffect(x: isOpen ? 0 : 1, y: isOpen ? 0 : 1)
                Spacer()
                Image("profile")
                    .padding(.top, 10)
                    .scaleEffect(x: isOpen ? 0 : 1, y: isOpen ? 0 : 1)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.leading, 56)
            .padding(.trailing, 12)
            .opacity(isOpen ? 0 : 1)
            
            VStack(spacing: isOpen ? menuVerticalGapSize : 3) {
                HStack(spacing: menuHorizontalGapSize) {
                    getMenuView(index: 0)
                    getMenuView(index: 1)
                    getMenuView(index: 2)
                }
                VStack(spacing: isOpen ? menuVerticalGapSize : -5) {
                    HStack(spacing: menuHorizontalGapSize) {
                        getMenuView(index: 3)
                        getMenuView(index: 4)
                        getMenuView(index: 5)
                    }
                    HStack(spacing: menuHorizontalGapSize) {
                        getMenuView(index: 6)
                        getMenuView(index: 7)
                        getMenuView(index: 8)
                    }
                }
            }
            .padding(.horizontal, isOpen ? menuHorizontalGapSize : 19)
        }
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.42), radius: 1, x: 0, y: 1)
        .frame(height: isOpen ? Data.Constants.menuOpenedSize : Data.Constants.menuClosedSize)
        .animation(animation)
        .padding(.horizontal, horizontalPadding)
        .padding(.top, 15)
        .onTapGesture { self.onToggle?()}
        
    }
    
    private func getMenuView(index: Int) -> MenuItemView {
        var item = MenuItemView(item: menuItems[index], isExpanded: isOpen) {
            if self.isOpen {
                Data.selectedMenuItemIndex = index
            }
            self.onToggle?()
        }
        item.width = itemWidth
        return item
    }
    
}


struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView(menuItems: .init(
            repeating: MenuItem(index: 0, title: "Inbox", imageName: "inboxIcon", selectedImageName: "inboxIconRed"),
            count: 9
            ))
    }
}
