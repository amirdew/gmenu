//
//  MenuBarView.swift
//  gmenu
//
//  Created by Amir on 01/12/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI
import UIKit

private struct Constants {
    static let closedBarHeight: CGFloat = 50
    static let rowHeight: CGFloat = 105
    static let itemWidth: CGFloat = 90
    static let itemHeight: CGFloat = 70
    static let horizontalPadding: CGFloat = 16
}


struct MenuBarView<Content: View>: View {
    
    var isOpen: Bool = false
    var menuItems: [MenuItem]
    var onToggle: (() -> Void)?
    var contentProvider: (() -> Content)?

    
    private var menuItemsInRows: [[MenuItem]] {
        menuItems
            .filledWith(DefaultMenuItem.empty, max: 6)
            .chunked(into: 3)
            .map { $0.filledWith(DefaultMenuItem.empty, max: 3) }
    }
    
    private var animation: Animation {
        Animation
            .spring(dampingFraction: 0.85)
            .speed(1.5)
    }
    
    private var menuVerticalGapSize: CGFloat {
        min(menuHorizontalGapSize * 4.8, 28)
    }
    
    private var menuHorizontalGapSize: CGFloat {
        let size = min(35, (UIScreen.main.bounds.width - (Constants.itemWidth * 3) - (Constants.horizontalPadding * 2))/4)
        return isOpen ? size : 3
    }
    
    var body: some View {
        ZStack(alignment: isOpen ? .center : .leading) {
            Color("cardBackground")
            
            contentProvider?()
            
            ZStack {
                ForEach(0..<menuItemsInRows.count) { row in
                    HStack(spacing: self.menuHorizontalGapSize) {
                        ForEach(0..<self.menuItemsInRows[row].count) { column in
                            self.getMenuItemView(row: row, column: column)
                        }
                    }
                    .offset(y: self.getRowYOffset(row: row))
                }
            }
            .padding(.horizontal, isOpen ? menuHorizontalGapSize : 19)
            .onTapGesture { self.onToggle?() }
        }
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.42), radius: 1, x: 0, y: 1)
        .frame(height: isOpen ? (CGFloat(self.menuItemsInRows.count) * (Constants.rowHeight)) : Constants.closedBarHeight)
        .animation(animation)
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.top, 15)
        
    }
    
    private func getRowYOffset(row: Int) -> CGFloat {
        let center = CGFloat(self.menuItemsInRows.count + 1) / 2
        var y: CGFloat = CGFloat(row + 1) < center ? -4 : 4
        if isOpen {
            y = CGFloat((CGFloat(row) + 1) - center) * (Constants.itemWidth + menuVerticalGapSize / 2)
        }
        return y
    }
    
    private func getMenuItemView(row: Int, column: Int) -> MenuItemView {
        let menuItem = menuItemsInRows[row][column]
        let index = row * menuItemsInRows.first!.count + column
        return MenuItemView(
            index: index,
            item: menuItem,
            isExpanded: isOpen,
            width: Constants.itemWidth,
            height: Constants.itemHeight
        ) {
            if self.isOpen, menuItem.id != DefaultMenuItem.empty.id {
                menuItem.setSelected()
            }
            self.onToggle?()
        }
    }
    
}


struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView<AnyView>(menuItems: .init(
            repeating: DefaultMenuItem(title: "Inbox", imageName: "inboxIcon", selectedImageName: "inboxIconRed"),
            count: 9
            ))
    }
}
