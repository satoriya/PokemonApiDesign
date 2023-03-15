//
//  ViewController.swift
//  PokemonApiDesign
//
//  Created by Phincon on 15/03/23.
//

import UIKit

class ListPokemonViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerCollectionView()
    }
    
    private func registerCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ListPokemonCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: ListPokemonCollectionViewCell.identifer)
    }
}
