//
//  ProfileDataService.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

class ProfileDataService {
    
    @Published var profile: Profile
    
    init() {
        if LocalFileManager.instance.loadProfile() == nil {
            self.profile = Profile()
        } else {
            self.profile = LocalFileManager.instance.loadProfile()!
        }
    }
    
    func saveProfile(profile: Profile) {
        LocalFileManager.instance.saveProfile(profile: profile)
    }

    
}
