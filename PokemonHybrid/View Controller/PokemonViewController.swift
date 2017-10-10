//
//  PokemonViewController.swift
//  PokemonHybrid
//
//  Created by Daniel Jin on 10/10/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let pokemon = pokemon else { return }
        
        self.nameLabel.text = pokemon.name
        self.idLabel.text = "\(pokemon.identifier)"
        self.abilityLabel.text = "\(pokemon.abilities.joined(separator: ", "))"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else { return  }
        
        PokemonController.shared().fetchPokemon(forSearchTerm: searchBarText) { (pokemon) in
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }

        }
    }
    
}
