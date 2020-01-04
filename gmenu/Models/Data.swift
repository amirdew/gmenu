//
//  Data.swift
//  gmenu
//
//  Created by Amir on 30/11/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import UIKit

struct Data {
    
    struct Constants {
        static let menuItems: [MenuItem] =  [
            DefaultMenuItem(title: "Inbox", imageName: "inboxIcon", selectedImageName: "inboxIconRed"),
            DefaultMenuItem(title: "Starred", imageName: "starIcon", selectedImageName: "starIconRed"),
            DefaultMenuItem(title: "Snoozed", imageName: "snoozedIcon", selectedImageName: "snoozedIconRed"),
            DefaultMenuItem(title: "Important", imageName: "importantIcon", selectedImageName: "importantIconRed"),
            DefaultMenuItem(title: "Sent", imageName: "sentIcon", selectedImageName: "sentIconRed"),
            DefaultMenuItem(title: "Scheduled", imageName: "scheduledIcon", selectedImageName: "scheduledIconRed"),
            DefaultMenuItem(title: "Drafts", imageName: "draftsIcon", selectedImageName: "draftsIconRed"),
            DefaultMenuItem(title: "All emails", imageName: "allEmailsIcon", selectedImageName: "allEmailsIconRed"),
            DefaultMenuItem(title: "Spam", imageName: "spamIcon", selectedImageName: "spamIconRed")
        ]
    }
    
    static var selectedMenuItemId: String = Constants.menuItems.first!.id
    
    static var emails: [Email] {
        [
            Email(
                sender: "Apple",
                time: "15:05",
                title: "Apple",
                description: "Get an Apple Store Gift Card of up to $200 on select products during our four-day shopping event. And more offers now through Monday."),
            Email(
                sender: "Meetup",
                time: "12:01",
                title: "New Meetup",
                description: "Weird Science Meetups, The Weird Science is an Innovation Agency with offices in The Netherlands and New Zealand."),
            Email(
                sender: "Weekly Digest",
                time: "11:25",
                title: "Weekly Digest",
                description: "Tis the season to put your skills and creativity to the test. Photographers can compete in 12 photo challenges for a chance to win an exciting prize from top photography brands."),
            Email(
                sender: "Goodreads",
                time: "10:15",
                title: "It’s your last chance to vote!",
                description: "Now until December 2, help your favorite books take home the win in the annual Goodreads Choice Awards, the only major book awards decided by you, the readers!"),
            Email(
                sender: "Apple",
                time: "15:05",
                title: "Apple",
                description: "Get an Apple Store Gift Card of up to $200 on select products during our four-day shopping event. And more offers now through Monday."),
            Email(
                sender: "Meetup",
                time: "12:01",
                title: "New Meetup",
                description: "Weird Science Meetups, The Weird Science is an Innovation Agency with offices in The Netherlands and New Zealand."),
            Email(
                sender: "Weekly Digest",
                time: "11:25",
                title: "Weekly Digest",
                description: "Tis the season to put your skills and creativity to the test. Photographers can compete in 12 photo challenges for a chance to win an exciting prize from top photography brands."),
            Email(
                sender: "Goodreads",
                time: "10:15",
                title: "It’s your last chance to vote!",
                description: "Now until December 2, help your favorite books take home the win in the annual Goodreads Choice Awards, the only major book awards decided by you, the readers!"),
            Email(
                sender: "Apple",
                time: "15:05",
                title: "Apple",
                description: "Get an Apple Store Gift Card of up to $200 on select products during our four-day shopping event. And more offers now through Monday."),
            Email(
                sender: "Meetup",
                time: "12:01",
                title: "New Meetup",
                description: "Weird Science Meetups, The Weird Science is an Innovation Agency with offices in The Netherlands and New Zealand."),
            Email(
                sender: "Weekly Digest",
                time: "11:25",
                title: "Weekly Digest",
                description: "Tis the season to put your skills and creativity to the test. Photographers can compete in 12 photo challenges for a chance to win an exciting prize from top photography brands."),
            Email(
                sender: "Goodreads",
                time: "10:15",
                title: "It’s your last chance to vote!",
                description: "Now until December 2, help your favorite books take home the win in the annual Goodreads Choice Awards, the only major book awards decided by you, the readers!"),
        ].shuffled()
    }
}


extension DefaultMenuItem {
    
    var isSelected: Bool {
        Data.selectedMenuItemId == id
    }
    
    func setSelected() {
        Data.selectedMenuItemId = id
    }
}
