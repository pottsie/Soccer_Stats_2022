//
//  LocalFileManager.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    let folderName = "Soccer-Stats"
    
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
                    return
                }
        if !FileManager.default.fileExists(atPath: path) {
            do {
                print(path)
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder \(folderName).)")
            } catch let error {
                print("Error creating the folder. \(error)")
            }
        }
    }
    
    func getPathForFile(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent(name) else {
                    print("Error getting data path")
                    return nil
                }
        return path
    }
    
    func saveGames(games: [Game]) {
        // encode games with json
        let data = encodeGames(games: games)
        guard let path = getPathForFile(name: "games-data") else {
            print("Error getting file path")
            return
        }
        
        do {
            try data?.write(to: path)
            print("GAME DATA SAVED \(path)")
            return
        } catch let error {
            print("Error writing the data \(error)")
            return
        }
    }
    
    func encodeGames(games: [Game]) -> Data? {
        do {
            let data = try JSONEncoder().encode(games)
            return data
        } catch let error {
            print("Error encoding data \(error)")
            return nil
        }
    }

    func loadGames() -> [Game]? {
        guard
            let path = getPathForFile(name: "games-data")?.path,
            FileManager.default.fileExists(atPath: path) else {
                print("Error getting path.")
                return nil
            }
        do {
            print("\(path)")
            let data = try Data(contentsOf: getPathForFile(name: "games-data")!)
            let games = try JSONDecoder().decode([Game].self, from: data)
            return games
        } catch let error {
            print("Error reading the data from the file. \(error)")
            return nil
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpeg") else {
                    print("Error getting path.")
                    return nil
                }
        return path
    }
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 0.5),
            let path = getPathForImage(name: name) else {
                print("Error getting data.")
                return
            }
        do {
            try data.write(to: path)
            print(path)
            print("Success saving!")
            return
        } catch let error {
            print("Error saving. \(error)")
            return
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
                print("Error getting path.")
                return nil
            }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) {
        guard
            let path = getPathForImage(name: name),
            FileManager.default.fileExists(atPath: path.path) else {
                print("Error getting path.")
                return
            }
        
        do {
            try FileManager.default.removeItem(at: path)
            return
        } catch let error {
            print("Error deleting image. \(error)")
            return
        }
    }
    
    func loadProfile() -> Profile? {
        guard
            let path = getPathForFile(name: "profile")?.path,
            FileManager.default.fileExists(atPath: path) else {
                print("Error getting path.")
                return nil
            }
        do {
            print("\(path)")
            let data = try Data(contentsOf: getPathForFile(name: "profile")!)
            let profile = try JSONDecoder().decode(Profile.self, from: data)
            return profile
        } catch let error {
            print("Error reading the data from the file. \(error)")
            return nil
        }
    }

    func saveProfile(profile: Profile) {
        // encode profile with json
        let data = encodeProfile(profile: profile)
        guard let path = getPathForFile(name: "profile") else {
            print("Error getting file path")
            return
        }
        
        do {
            try data?.write(to: path)
            print("GAME DATA SAVED \(path)")
            return
        } catch let error {
            print("Error writing the data \(error)")
            return
        }
    }
    
    func encodeProfile(profile: Profile) -> Data? {
        do {
            let data = try JSONEncoder().encode(profile)
            return data
        } catch let error {
            print("Error encoding data \(error)")
            return nil
        }
    }

}
