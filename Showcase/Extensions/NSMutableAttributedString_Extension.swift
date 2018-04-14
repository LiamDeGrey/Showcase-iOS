//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {

    func addAttributes(attributes: [NSAttributedStringKey: Any]) {
        addAttributes(attributes, range: NSRange(location: 0, length: length))
    }

    func addAttribute(name: NSAttributedStringKey, value: Any) {
        addAttribute(name, value: value, range: NSRange(location: 0, length: length))
    }

    func addAttributesToPortion(attributes: [NSAttributedStringKey: Any], text: String) {
        if let range = string.range(of: text) {
            addAttributes(attributes, range: NSRange(range, in: string))
        }
    }

    func setColor(textColor: UIColor) {
        addAttribute(name: NSAttributedStringKey.foregroundColor, value: textColor)
    }
}