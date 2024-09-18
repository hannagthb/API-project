//
//  ViewModel.swift
//  HarryPotterChecker
//
//  Created by Hanna Che on 17/09/2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var spells:[Spells] = []
    @Published var books:[Books] = []
    @Published var characters:[Characters] = []
    @Published var houses:[Houses] = []
    
    var names = ["Books", "Characters", "Houses", "Spells"]
    var icons = ["📚", "🧙", "🏠", "🪄"]
    
    private let urlStringForSpells = "https://potterapi-fedeperin.vercel.app/en/spells"
    private let urlStringForBooks = "https://potterapi-fedeperin.vercel.app/en/books"
    private let urlStringForCharacters = "https://potterapi-fedeperin.vercel.app/en/characters"
    private let urlStringForHouses = "https://potterapi-fedeperin.vercel.app/en/houses"
    
    func fetchSpells() {
        guard let url = URL(string: urlStringForSpells) else {
            print("Can't get url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode([Spells].self, from: data)
                        DispatchQueue.main.async {
                            self.spells = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
    }
    
    func fetchBooks() {
        guard let url = URL(string: urlStringForBooks) else {
            print("Can't get url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode([Books].self, from: data)
                        DispatchQueue.main.async {
                            self.books = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
    }
    
    func fetchCharacters() {
        guard let url = URL(string: urlStringForCharacters) else {
            print("Can't get url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode([Characters].self, from: data)
                        DispatchQueue.main.async {
                            self.characters = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
    }
    
    func fetchHouses() {
        guard let url = URL(string: urlStringForHouses) else {
            print("Can't get url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode([Houses].self, from: data)
                        DispatchQueue.main.async {
                            self.houses = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
    }
}
