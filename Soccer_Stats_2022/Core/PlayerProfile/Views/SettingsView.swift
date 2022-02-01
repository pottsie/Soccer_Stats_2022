//
//  SettingsView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/31/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    NavigationLink {
                        Text("Game length, Enable goalie stats")
                    } label: {
                        Text("Statistical Settings")
                    }
                } header: {
                    Text("Settings")
                }

                Section {
                    NavigationLink {
                        Text("Version #")
                    } label: {
                        Text("About")
                    }

                    NavigationLink {
                        Text("App Instructions")
                    } label: {
                        Text("Help")
                    }
                    NavigationLink {
                        Text("Developer Email, Twitter, Etc")
                    } label: {
                        Text("Contact Developer")
                    }
                } header: {
                    Text("Resources")
                }

                Section {
                    Text("Clear on Device Storage")
                } header: {
                    Text("Manage Data") // Generate confirming delete action
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // Save and dismiss the view
                        dismiss()
                    } label: {
                        Label("Close settings", systemImage: "x.circle")
                    }

                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
