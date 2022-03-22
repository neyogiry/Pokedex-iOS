//
//  Pokemon.swift
//  Pokedex
//
//  Created by neyogiry on 3/01/22.
//

import Foundation

struct PokemonResponse: Decodable {
    let count: Int?
    let next: String?
    let results: [Pokemon]
}


struct Pokemon: Decodable {
    let name: String?
    let url: String?
}
