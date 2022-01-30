//
//  ProfileViewModel.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: Profile
    
    init() {
        profile = Profile()
    }
    
}
