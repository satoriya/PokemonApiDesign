//
//  Extension.swift
//  PokemonApiDesign
//
//  Created by Phincon on 15/03/23.
//

import Foundation
import UIKit

extension UIView {
    func addRoundedCorners() {
        let s = self.layer
        s.cornerRadius = 6.0
        s.masksToBounds = true
        // set the shadow properties
        s.shadowColor = UIColor.black.cgColor
        s.shadowOffset = CGSize(width: 0, height: 1.0)
        s.shadowOpacity = 0.2
        s.shadowRadius = 4.0
    }
}
