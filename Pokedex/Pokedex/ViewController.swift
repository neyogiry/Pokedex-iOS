//
//  ViewController.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    private let pokemonList = Array(0...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 213.0/255, green: 59.0/255, blue: 71.0/255, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func setupCollectionView() {
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        
        pokemonCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        pokemonCollectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pokemonCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "pokemonDetailVC" {
//            if let pdController = segue.destination as? PokemonDetailViewController {
//
//            }
//        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCollectionViewCell
        return cell!
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pokemonDetailVC", sender: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width1 = UIScreen.main.bounds.width
        let width2 = pokemonCollectionView.bounds.width
        let width3 = pokemonCollectionView.frame.width
        let width4 = collectionView.frame.size.width
        
        let height1 = UIScreen.main.bounds.height
        let height2 = pokemonCollectionView.bounds.height
        let height3 = pokemonCollectionView.frame.height
        let height4 = collectionView.frame.size.height
        
        let collectionWidth = collectionView.frame.width
        let collectionHeight = collectionView.frame.height
        let padding: CGFloat = 10
        let rowWidth = collectionWidth - padding
        let myCellWidth = rowWidth / 2
        let myCellHeight = collectionHeight / 3.5
        return CGSize(width: myCellWidth, height: myCellHeight)
    }

}
