//
//  HeroViewCell.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit
import Kingfisher

class HeroViewCell: UITableViewCell {

    public static let xibName = "HeroViewCell"
    public static let cellIdentifier = "heroViewCell"

    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!

    func assemble(heroInformation: HeroInformation) {
        self.name.text = heroInformation.name
        print(heroInformation.thumbnail.getListURL())
        self.heroImage.kf.setImage(with: heroInformation.thumbnail.getListURL())
    }

}
