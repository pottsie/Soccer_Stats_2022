//
//  ProfileView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var profileVM: ProfileViewModel
    @State var showEditProfileView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                PlayerImageView(size: 175, image: nil)
                    .padding(.vertical)
                
                Text(profileVM.profile.fullName)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.theme.primaryText)
                Group {
                Text(profileVM.profile.team)
                Text(profileVM.profile.position)
                Text("#\(profileVM.profile.jerseyNumber)")
                }
                .foregroundColor(Color.theme.secondaryText)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Date of Birth".uppercased())
                                .font(.caption)
                                .foregroundColor(Color.theme.secondaryText)
                            Text("\(profileVM.profile.dateOfBirth.formatted(date: .abbreviated, time: .omitted))")
                                .fontWeight(.bold)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Age Group".uppercased())
                                .font(.caption)
                                .foregroundColor(Color.theme.secondaryText)
                            Text(profileVM.profile.ageGroup)
                                .fontWeight(.bold)

                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Email".uppercased())
                                .font(.caption)
                                .foregroundColor(Color.theme.secondaryText)
                            Text(profileVM.profile.email)
                                .fontWeight(.bold)

                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Phone".uppercased())
                                .font(.caption)
                                .foregroundColor(Color.theme.secondaryText)
                            Text(profileVM.profile.phone)
                                .fontWeight(.bold)

                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Twitter".uppercased())
                                .font(.caption)
                                .foregroundColor(Color.theme.secondaryText)
                            Text(profileVM.profile.twitter)
                                .fontWeight(.bold)

                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Instagram".uppercased())
                                .font(.caption)
                                .foregroundColor(Color.theme.secondaryText)
                            Text(profileVM.profile.instagram)
                                .fontWeight(.bold)

                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Facebook".uppercased())
                                .font(.caption)
                                .foregroundColor(Color.theme.secondaryText)
                            Text(profileVM.profile.facebook)
                                .fontWeight(.bold)

                        }
                        Spacer()
//                        VStack(alignment: .trailing) {
//                            Text("Phone".uppercased())
//                                .font(.caption)
//                                .foregroundColor(Color.theme.secondaryText)
//                            Text(profileVM.profile.phone)
//                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)


                }

                Spacer()
            }
            .fullScreenCover(isPresented: $showEditProfileView, content: {
                EditPlayerProfileView()
            })
            .navigationTitle("Player Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showEditProfileView.toggle()
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
    }
}
