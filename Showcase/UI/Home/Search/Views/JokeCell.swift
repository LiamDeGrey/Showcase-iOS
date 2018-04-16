//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class JokeCell: UITableViewCell {
    @IBOutlet fileprivate weak var characterView: CharacterView!
    @IBOutlet fileprivate weak var jokeLabel: CustomLabel!


    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        backgroundColor = highlighted ? UIColor.mediumLightGrey : UIColor.clear
    }
}

//MARK: Public methods

extension JokeCell {

    func populateView(number: Int, joke: Joke) {
        setJokeNumber(number: number)
        setJoke(joke: joke)
    }
}

//MARK: Private methods

private extension JokeCell {

    func setJokeNumber(number: Int) {
        characterView.updateCharacter(character: number)
    }

    func setJoke(joke: Joke) {
        jokeLabel.text = joke.body
    }
}