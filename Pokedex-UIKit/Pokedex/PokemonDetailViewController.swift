//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by neyogiry on 22/12/21.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    static let pokemonBaselineHeight = CGFloat(50)
    
    private let pokemonInformationBackgroundColor: UIColor = .white

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var pokemonBaselineView: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokemonTypeCollectionView: UICollectionView!
    @IBOutlet weak var pokemonDescriptionLabel: UILabel!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
        self.changeStatusBarColor(backgroundColor: pokemonInformationBackgroundColor)
        self.headerView.backgroundColor = pokemonInformationBackgroundColor
        self.pokemonBaselineView.backgroundColor = pokemonInformationBackgroundColor
        self.pokemonTypeCollectionView.backgroundColor = pokemonInformationBackgroundColor
        
        self.pokemonBaselineView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        
        self.pokemonLabel.text = pokemon?.name ?? ""
        self.pokemonImageView.image = nil
        self.pokemonImageView.load(ImageHelper.pokemonImageUrl(pokemon?.url ?? "")) { image in
            if let color = image?.averageColor {
                self.changeStatusBarColor(backgroundColor: color)
                self.headerView.backgroundColor = color
            }
        }
        self.pokemonDescriptionLabel.isHidden = true
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

