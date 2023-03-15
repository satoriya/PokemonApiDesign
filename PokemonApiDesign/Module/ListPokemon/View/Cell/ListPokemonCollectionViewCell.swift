//
//  ListPokemonCollectionViewCell.swift
//  PokemonApiDesign
//
//  Created by Phincon on 15/03/23.
//

import UIKit

class ListPokemonCollectionViewCell: UICollectionViewCell {
    static let identifer = "ListPokemonCollectionViewCell"
    
    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.addRoundedCorners()
        }
    }
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
