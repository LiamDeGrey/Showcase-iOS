//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class CharacterView: UIView {
    fileprivate var character: String? {
        didSet {
            layoutIfNeeded()
        }
    }

    func updateCharacter(character: Character) {
        updateCharacter(character: String(character))
    }

    func updateCharacter(character: Int) {
        updateCharacter(character: String(character))
    }

    func updateCharacter(character: String) {
        if character.count == 1 {
            self.character = character
        } else if character.count > 1 {
            self.character = String(character.first!)
        } else {
            self.character = nil
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        //Draw background
        let path = UIBezierPath(roundedRect: rect, cornerRadius: Dimensions.cornerRadius_extra)
        path.lineWidth = Dimensions.strokeWidth

        UIColor.semiTransparent.setFill()
        UIColor.darkGrey.setStroke()

        path.fill()
        path.stroke()

        //Draw character
        if let character = character {
            let characterSize = rect.height - Dimensions.padding_16
            let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: characterSize)
            var attributes = Attributes.getCharacterViewAttributes(forSize: characterSize)
            let boundingBox = character.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            let drawFrame = CGRect(
                    x: (frame.width / 2.0) - (boundingBox.width / 2.0),
                    y: (frame.height / 2.0) - (boundingBox.height / 2.0),
                    width: boundingBox.width,
                    height: boundingBox.height)

            character.draw(with: drawFrame, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        }
    }
}
