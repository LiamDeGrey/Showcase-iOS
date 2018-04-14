//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

extension UIColor {
    //Primary Palette
    static let darkGrey = buildColor(red: 38, green: 38, blue: 38, alpha: 1)
    static let mediumGrey = buildColor(red: 64, green: 64, blue: 64, alpha: 1)
    static let lightGrey = buildColor(red: 191, green: 191, blue: 191, alpha: 1)
    static let blue = buildColor(red: 162, green: 253, blue: 255, alpha: 1)

    //Secondary palette
    static let errorRed = buildColor(red: 189, green: 84, blue: 89, alpha: 1)
    static let superDarkGrey = buildColor(red: 22, green: 22, blue: 22, alpha: 1)
    static let mediumLightGrey = buildColor(red: 82, green: 82, blue: 82, alpha: 1)
    static let disabledGrey = buildColor(red: 141, green: 141, blue: 141, alpha: 1)
    static let semiTransparent = buildColor(red: 0, green: 0, blue: 0, alpha: 0.5)
}

extension UIColor {

    fileprivate static func buildColor(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(
                red: CGFloat(red) / 255,
                green: CGFloat(green) / 255,
                blue: CGFloat(blue) / 255,
                alpha: alpha
        )
    }

    static func buildColor(hexColor: String) -> UIColor? {
        var hexColorSanitized = hexColor.trimmingCharacters(in: .whitespacesAndNewlines)
        hexColorSanitized = hexColorSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt32 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexColorSanitized.count

        guard Scanner(string: hexColorSanitized).scanHexInt32(&rgb) else {
            return nil
        }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
