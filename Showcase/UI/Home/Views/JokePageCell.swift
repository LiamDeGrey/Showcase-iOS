//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class JokePageCell: UICollectionViewCell {
    @IBOutlet weak var characterView: CharacterView!
    @IBOutlet weak var bodyView: CustomLabel!


    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    func commonInit() {
        borderColor = UIColor.darkGrey
        borderWidth = Dimensions.strokeWidth
        cornerRadius = Dimensions.cornerRadius_extra
        backgroundColor = UIColor.mediumGrey

        setShadow()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        bodyView.adjustsFontSizeToFitWidth = true
    }

    func populateView(number: Int, joke: Joke) {
        characterView.updateCharacter(character: number)
        bodyView.text = joke.body
    }
}
