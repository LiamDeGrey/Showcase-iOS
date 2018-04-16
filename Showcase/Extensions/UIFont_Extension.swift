//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

extension UIFont {
    private static let FONT_LATO_REGULAR = "Lato-Regular"
    private static let FONT_LATO_LIGHT = "Lato-Light"
    private static let FONT_LATO_BOLD = "Lato-Bold"

    static func body1Font() -> UIFont {
        return UIFont(name: FONT_LATO_REGULAR, size: Dimensions.textSize_16)!
    }

    static func body2Font() -> UIFont {
        return UIFont(name: FONT_LATO_LIGHT, size: Dimensions.textSize_12)!
    }

    static func header1Font() -> UIFont {
        return UIFont(name: FONT_LATO_BOLD, size: Dimensions.textSize_32)!
    }

    static func header2Font() -> UIFont {
        return UIFont(name: FONT_LATO_BOLD, size: Dimensions.textSize_20)!
    }

    static func getCharacterViewFont(forSize: CGFloat) -> UIFont {
        return UIFont(name: FONT_LATO_BOLD, size: forSize)!
    }
}
