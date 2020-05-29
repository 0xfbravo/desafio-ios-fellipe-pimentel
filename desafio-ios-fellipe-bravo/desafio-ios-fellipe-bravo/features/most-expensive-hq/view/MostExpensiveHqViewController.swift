//
//  MostExpensiveHqViewController.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire

class MostExpensiveHqViewController: UIViewController {
    
    var presenter: MostExpensiveHqPresenterProtocol!
    
    // MARK: - Outlets
    @IBOutlet private weak var comicImage: UIImageView!
    @IBOutlet private weak var comicPrice: UILabel!
    @IBOutlet private weak var comicTitle: UILabel!
    @IBOutlet private weak var comicDescription: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assembleUI()
    }

    // MARK: - UI
    func assembleUI() {
        presenter.mostExpensiveHq
                .bind { [weak self] mostExpensiveHq in
                    let highestComicPrice = mostExpensiveHq.prices.max(by: { $0.price > $1.price || $1.price > $0.price })?.price ?? 0.0
                    self?.comicImage.kf.indicatorType = .activity
                    self?.comicImage.kf.setImage(with: mostExpensiveHq.thumbnail.getDetailsURL(), options: [.transition(.fade(1))])
                    self?.comicPrice.text = self?.formatComicPrice(comicPrice: highestComicPrice)
                    self?.comicTitle.text = mostExpensiveHq.title
                    self?.comicDescription.text = mostExpensiveHq.resultDescription
                }
                .disposed(by: presenter.disposeBag)

        presenter.getMostExpensiveComic()
    }

    private func formatComicPrice(comicPrice: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.init(identifier: "en_US")
        return currencyFormatter.string(from: NSNumber(value: comicPrice))!
    }

}

// MARK: - Protocol
extension MostExpensiveHqViewController: MostExpensiveHqViewProtocol {
    
}
