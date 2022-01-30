//
//  LocalFileManager.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

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
}
