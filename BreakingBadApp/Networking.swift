//
//  Networking.swift
//  BreakingBadApp
//
//  Created by Pandos on 01.03.2021.
//

import Foundation

let url = "https://www.breakingbadapi.com/api/characters"

extension CharactersViewController {
    func fetchCharacters() {
        guard let url = URL(string: url ) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                self.characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
