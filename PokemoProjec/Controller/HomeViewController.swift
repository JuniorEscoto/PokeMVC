//
//  HomeViewController.swift
//  PokemoProjec
//
//  Created by user922809 on 6/2/20.
//  Copyright © 2020 user922809. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var pokemons = ConexionAPI.shareInstance.getPokemon()
    var filterPokemon = [pokemonClass]()
    @IBOutlet weak var tableView: UITableView!
    
    let countries = ["Mexico", "Salvador", "Belice", "Guatemala", "Honduras", "Nicaragua", "Panama"]
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterPokemon = pokemons
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell") 
    }

}

// extension
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // countries.count
        filterPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? HomeTableViewCell
        
        let Pokemon = filterPokemon[(indexPath as NSIndexPath).row]
        cell?.awakeFromNib(Pokemon.id, name: Pokemon.name, pokeImageUrl: Pokemon.pokeImgUrl)
            //cell?.labelName.text = countries[indexPath.row]
        
        return cell!
    }
    
    
}
