//
//  ProfileViewModel.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    private let dataService = ProfileDataService()
    
    @Published var profile: Profile
    @Published var profileImage: UIImage? = LocalFileManager.instance.getImage(name: "profile")

    
    init() {
        profile = dataService.profile
    }
    
    private func saveImage() {
        LocalFileManager.instance.saveImage(image: profileImage ?? UIImage(named: "profile-default")!, name: "profile")
    }

    func saveProfile() {
        saveImage()
        dataService.saveProfile(profile: profile)
    }
    
}
