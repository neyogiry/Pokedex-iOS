//
//  UIImageViewExtension.swift
//  Pokedex
//
//  Created by neyogiry on 5/01/22.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    func load(_ url: String) {
        if let withURL = URL(string: url) {
            af.setImage(withURL: withURL)
        }
    }
    
}
