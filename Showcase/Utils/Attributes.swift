//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class Attributes {

    static func getBody1Attributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body1Font(),
            NSAttributedStringKey.foregroundColor: UIColor.lightGrey
        ]
    }

    static func getBody1DarkAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body1Font(),
            NSAttributedStringKey.foregroundColor: UIColor.darkGrey
        ]
    }

    static func getBody1ErrorAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body1Font(),
            NSAttributedStringKey.foregroundColor: UIColor.errorRed
        ]
    }

    static func getBody1ColoredAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body1Font(),
            NSAttributedStringKey.foregroundColor: UIColor.blue
        ]
    }

    static func getBody2Attributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body2Font(),
            NSAttributedStringKey.foregroundColor: UIColor.lightGrey
        ]
    }

    static func getBody2ErrorAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body2Font(),
            NSAttributedStringKey.foregroundColor: UIColor.errorRed
        ]
    }

    static func getBody2ColoredAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body2Font(),
            NSAttributedStringKey.foregroundColor: UIColor.blue
        ]
    }

    static func getHeader1Attributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.header1Font(),
            NSAttributedStringKey.foregroundColor: UIColor.lightGrey
        ]
    }

    static func getHeader2Attributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.header2Font(),
            NSAttributedStringKey.foregroundColor: UIColor.lightGrey
        ]
    }

    static func getHeader2DarkAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.header2Font(),
            NSAttributedStringKey.foregroundColor: UIColor.darkGrey
        ]
    }

    static func getHeader2ErrorAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.header2Font(),
            NSAttributedStringKey.foregroundColor: UIColor.errorRed
        ]
    }

    static func getLinkAttributes() -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.body1Font(),
            NSAttributedStringKey.foregroundColor: UIColor.blue,
            NSAttributedStringKey.underlineColor: UIColor.blue,
            NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,
        ]
    }

    static func getContentUnavailableAttributes(forSize: CGFloat) -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.getContentUnavailableLogoFont(forSize: forSize),
            NSAttributedStringKey.foregroundColor: UIColor.blue
        ]
    }

    static func getContentUnavailableOutlineAttributes(forSize: CGFloat) -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.getContentUnavailableLogoFont(forSize: forSize),
            NSAttributedStringKey.foregroundColor: UIColor.darkGrey
        ]
    }
}
