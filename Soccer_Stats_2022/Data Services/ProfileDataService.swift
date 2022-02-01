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
        guard
            let returnedProfile = LocalFileManager.instance.loadProfile() else {
                self.profile = Profile()
                return
            }
        self.profile = returnedProfile
    }
    
    func saveProfile(profile: Profile) {
        LocalFileManager.instance.saveProfile(profile: profile)
    }
}
