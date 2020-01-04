//
//  EmailListView.swift
//  gmenu
//
//  Created by Amir on 01/12/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI

struct EmailListView: View {
    
    var emails: [Email]
    var isMenuOpen = false
    
    private var animation: Animation {
        Animation
            .spring(dampingFraction: 0.65)
            .speed(1.4)
            .delay(0.1)
    }
    
    private var title: String {
        Data.Constants.menuItems.first {
            $0.isSelected
            }?.title.uppercased() ?? ""
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.top, 20)
                    .padding(.bottom, 6)
                    .padding(.leading, 16)
                    .font(.caption)
                    .foregroundColor(Color("text"))
                ForEach(emails) {
                    EmailView(email: $0)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 16)
                        .contextMenu {
                            Button(action: {}) {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                            Button(action: {}) {
                                Text("Archive")
                                Image(systemName: "archivebox")
                            }
                    }
                }
                .padding(.top, 16)
            }
        }
        .padding(.top, 7 + (self.isMenuOpen ? 200 : 50))
        .animation(animation)
    }
}

struct EmailListView_Previews: PreviewProvider {
    static var previews: some View {
        EmailListView(emails: .init(
            repeating:
            Email(
                sender: "Apple",
                time: "15:05",
                title: "Apple",
                description: "Get an Apple Store Gift Card of up to $200 on select products during our four-day shopping event. And more offers now through Monday."
            ),
            count: 20
            ))
    }
}
