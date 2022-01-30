//
//  EditPlayerProfileView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/24/22.
//

import SwiftUI

struct EditPlayerProfileView: View {
//    @Binding var player: PlayerProfile
    @EnvironmentObject private var profileVM: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    @State var showPhotoPicker: Bool = false
    
    var body: some View {
        VStack {
            imageSelectionSection
                .padding(.vertical)
//                .sheet(isPresented: $showPhotoPicker) {
//                    PhotoPicker(profileImage: $playerVM.profileImage)
//                }
            Form {
                soccerDataSection
                contactDataSection
                buttonSection
            }
            Spacer()
        }
    }
}

struct EditPlayerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayerProfileView()
            .environmentObject(ProfileViewModel())

    }
}

extension EditPlayerProfileView {
    var buttonSection: some View {
        Section {
            Button {
//                playerVM.updateProfileInformation()
                dismiss()
            } label: {
                Text("Save Changes")
            }
            Button(role: .destructive) {
                dismiss()
            } label: {
                Text("Cancel and Discard Changes")
            }
        }
    }
    
    var imageSelectionSection: some View {
        HStack {
            PlayerImageView(size: 100, image: nil)
                .onTapGesture {
                    showPhotoPicker.toggle()
                }
            Text("Tap image to choose a new profile picture.")
                .foregroundColor(Color.theme.secondaryText)
                .italic()
                .multilineTextAlignment(.center)
        }
    }
    
    var soccerDataSection: some View {
        Section {
            TextField("Name", text: $profileVM.profile.firstName)
                .submitLabel(.next)
                .textInputAutocapitalization(.words)
            TextField("Name", text: $profileVM.profile.lastName)
                .submitLabel(.next)
                .textInputAutocapitalization(.words)
            TextField("Position", text: $profileVM.profile.position)
                .submitLabel(.next)
                .textInputAutocapitalization(.words)
            TextField("Jersey number", text: $profileVM.profile.jerseyNumber)
                .keyboardType(.numbersAndPunctuation)
                .submitLabel(.next)

            DatePicker("Date of Birth",
                       selection: $profileVM.profile.dateOfBirth,
                       in: ...Date(),
                       displayedComponents: [.date]
            )
            TextField("Team", text: $profileVM.profile.team)
                .submitLabel(.next)
            TextField("Age group", text: $profileVM.profile.ageGroup)
                .submitLabel(.next)
            Toggle("Goalie?", isOn: $profileVM.profile.isGoalie)

        } header: {
            Text("Soccer Data")
        }
    }
    
    var contactDataSection: some View {
        Section {
            TextField("Email", text: $profileVM.profile.email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .submitLabel(.next)

            TextField("Phone", text: $profileVM.profile.phone)
                .submitLabel(.next)
                .keyboardType(.numbersAndPunctuation)

            TextField("@Twitter", text: $profileVM.profile.twitter)
                .submitLabel(.next)
                .textInputAutocapitalization(.never)
                .keyboardType(.twitter)
            
            TextField("Instagram", text: $profileVM.profile.instagram)
                .submitLabel(.done)
                .textInputAutocapitalization(.never)
            TextField("Facebook", text: $profileVM.profile.facebook)
                .submitLabel(.done)
                .textInputAutocapitalization(.never)
        } header: {
            Text("Contact Data (Leave blank if none)")
        }
    }
}
