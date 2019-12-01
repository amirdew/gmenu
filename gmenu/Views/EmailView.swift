//
//  EmailView.swift
//  gmenu
//
//  Created by Amir on 30/11/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI

struct EmailView: View {
    
    var email: Email
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                Text(email.sender.prefix(1))
                    .font(.avatar)
                    .foregroundColor(Color.white.opacity(0.62))
            }
            .frame(width: 42, height: 42)
            .background(Color.randomAvatar)
            .cornerRadius(21)
            
            Spacer(minLength: 16)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(email.title)
                        .font(.callout)
                        .foregroundColor(Color("text"))
                    Spacer()
                    Text(email.time)
                        .font(.caption)
                        .foregroundColor(Color("text"))
                }
                .padding(.bottom, 5)
                
                Text(email.description)
                    .font(.footnote)
                    .foregroundColor(Color("text"))
                    .lineLimit(2)
            }
        }
    }
}


private extension Color {
    static var randomAvatar: Color {
        let colors = [
            Color(red: 234.0/255.0, green: 67.0/255.0, blue: 53.0/255.0),
            Color(red: 36.0/255.0, green: 192.0/255.0, blue: 224.0/255.0),
            Color(red: 249.0/255.0, green: 123.0/255.0, blue: 23.0/255.0),
            Color(red: 251.0/255.0, green: 187.0/255.0, blue: 6.0/255.0)
        ]
        return colors[Int.random(in: 0..<colors.count)]
    }
}


private extension Font {
    static var avatar: Font {
        return system(size: 24, weight: .semibold, design: .default)
    }
}


struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView(email: Email(
                       sender: "Apple",
                       time: "15:05",
                       title: "Apple",
                       description: "Get an Apple Store Gift Card of up to $200 on select products during our four-day shopping event. And more offers now through Monday."
                   ))
    }
}
