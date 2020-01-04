//
//  ContentView.swift
//  gmenu
//
//  Created by Amir on 29/11/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var emails: [Email]
    var menuItems: [MenuItem]
    
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            EmailListView(emails: emails, isMenuOpen: isMenuOpen)
                .blur(radius: isMenuOpen ? 1 : 0)
            
            // dark overlay
            Color(UIColor.black.withAlphaComponent(isMenuOpen ? 0.32 : 0))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { self.toggleMenu() }
            
            MenuBarView(
                isOpen: isMenuOpen,
                menuItems: menuItems,
                onToggle: {
                    self.toggleMenu()
            }) {
                HStack {
                    Text("Search email")
                        .foregroundColor(Color("text"))
                        .scaleEffect(x: self.isMenuOpen ? 0 : 1, y: self.isMenuOpen ? 0 : 1)
                    Spacer()
                    Image("profile")
                        .padding(.top, 10)
                        .scaleEffect(x: self.isMenuOpen ? 0 : 1, y: self.isMenuOpen ? 0 : 1)
                        .frame(maxHeight: .infinity, alignment: .top)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.leading, 56)
                .padding(.trailing, 12)
                .opacity(self.isMenuOpen ? 0 : 1)
            }
        }
    }
    
    private func toggleMenu() {
        withAnimation {
            self.isMenuOpen.toggle()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            emails: .init(
                repeating:
                Email(
                    sender: "Apple",
                    time: "15:05",
                    title: "Apple",
                    description: "our four day show is started, do you want to join? the join, buy expensive stuff from us for no good damn reason"
                ),
                count: 20
            ),
            
            menuItems: .init(
                repeating: DefaultMenuItem(title: "Inbox", imageName: "inboxIcon", selectedImageName: "inboxIconRed"),
                count: 9
            )
        )
    }
}
