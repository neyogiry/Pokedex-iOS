//
//  PokemonDataSource.swift
//  Pokedex
//
//  Created by neyogiry on 3/01/22.
//

import Foundation

protocol PokemonDataSource {
    func all(
        success: @escaping (_ response: PokemonResponse) -> Void
    )
    func detail(
        url: String,
        success: @escaping (_ response: PokemonDetailResponse) -> Void
    )
}
