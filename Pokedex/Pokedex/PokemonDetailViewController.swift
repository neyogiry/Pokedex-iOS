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
    @IBOutlet weak var pokemonTypeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
        changeStatusBarColor(backgroundColor: .systemTeal)
    }
    
    private func setupNavigationController() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
        self.pokemonBaselineView.backgroundColor = pokemonInformationBackgroundColor
        self.pokemonTypeCollectionView.backgroundColor = pokemonInformationBackgroundColor
        
        self.pokemonBaselineView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

