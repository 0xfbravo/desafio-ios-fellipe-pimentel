//
//  Colors.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit

enum AppColors {
    case lightPeriwinkle, darkBlueGray, maximumYellowRed, babyPowder, bitterSweet
    
    var color: UIColor {
        switch self {
            case .lightPeriwinkle: return #colorLiteral(red: 0.721568644, green: 0.721568644, blue: 0.8196078539, alpha: 1)
            case .darkBlueGray: return #colorLiteral(red: 0.3568627451, green: 0.3725490196, blue: 0.5921568627, alpha: 1)
            case .maximumYellowRed: return #colorLiteral(red: 1, green: 0.7568627451, blue: 0.2705882353, alpha: 1)
            case .babyPowder: return #colorLiteral(red: 1, green: 1, blue: 0.9843137255, alpha: 1)
            case .bitterSweet: return #colorLiteral(red: 1, green: 0.4196078431, blue: 0.4235294118, alpha: 1)
        }
    }
}
