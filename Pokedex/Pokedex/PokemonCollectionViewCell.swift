//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/21.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .cyan
    }

}
