//
//  Profile.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import Foundation

struct Profile {
    var firstName: String
    var lastName: String
    var position: String
    var jerseyNumber: String
    var team: String
    var isGoalie: Bool
    var dateOfBirth: Date
    var ageGroup: String
    var email: String
    var phone: String
    var facebook: String
    var twitter: String
    var instagram: String
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init() {
        self.firstName = "First"
        self.lastName = "Last"
        self.position = "Position"
        self.jerseyNumber = "0"
        self.team = "Team Name"
        self.isGoalie = false
        self.dateOfBirth = Date()
        self.ageGroup = "U-99"
        self.email = "name@domain.com"
        self.phone = "xxx-xxx-xxxx"
        self.facebook = ""
        self.twitter = ""
        self.instagram = ""
    }
}
