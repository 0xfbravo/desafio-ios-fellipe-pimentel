//
//  CharacterViewCell.swift
//  desafio-ios-fellipe-bravo
//s
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterViewCell: UITableViewCell {

    public static let xibName = "CharacterViewCell"
    public static let cellIdentifier = "characterViewCell"

    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var characterImage: UIImageView!
    
    func assemble(characterInformation: CharacterInformation) {
        self.name.text = characterInformation.name
        
        self.characterImage.kf.indicatorType = .activity
        self.characterImage.kf.setImage(with: characterInformation.thumbnail.getListURL(), options: [.transition(.fade(1))])
    }

}
