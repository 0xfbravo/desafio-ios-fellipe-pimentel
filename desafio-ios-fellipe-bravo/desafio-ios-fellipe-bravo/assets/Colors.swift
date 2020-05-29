//
//  Colors.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit

enum AppColors {
    case a1, a2, a3, a4, black, white;
    
    var color: UIColor {
        switch self {
            case .a1: return #colorLiteral(red: 0.1333333333, green: 0.1568627451, blue: 0.1921568627, alpha: 1)
            case .a2: return #colorLiteral(red: 0.2235294118, green: 0.2431372549, blue: 0.2745098039, alpha: 1)
            case .a3: return #colorLiteral(red: 0, green: 0.6784313725, blue: 0.7098039216, alpha: 1)
            case .a4: return #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
            case .black: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .white: return #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        }
    }
}
