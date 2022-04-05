//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by neyogiry on 22/03/22.
//

import Foundation

//https://pokeapi.co/docs/v2#pokemon

struct PokemonDetailResponse: Decodable {
    let order: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonType]
}

struct PokemonType: Decodable {
    let slot: Int
    let type: PokemonTypeDetail
}

struct PokemonTypeDetail: Decodable {
    let name: String
    let url: String
}
