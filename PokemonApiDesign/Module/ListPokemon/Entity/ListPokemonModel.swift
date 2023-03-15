//
//  ListPokemonModel.swift
//  PokemonApiDesign
//
//  Created by Phincon on 15/03/23.
//

import Foundation

struct ListPokemonModel: Codable {
    let count: Int
    var results: [ListPokemonResults] = []
}

struct ListPokemonResults: Codable {
    let name: String
    let url: String
    
    mutating func convertStringIntoURL() -> URL {
        guard let url = URL(string: self.url) else {
            return URL(string: "")!
        }
        return url
    }
}
