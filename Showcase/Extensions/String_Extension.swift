//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

extension String {
    static let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    var url: URL? {
        return URL(string: self)
    }

    func isValidEmail() -> Bool {
        if (isEmpty) {
            return false
        }

        do {
            let regex = try NSRegularExpression(pattern: String.emailRegEx)
            let results = regex.matches(in: self, range: NSRange(location: 0, length: count))

            if results.count == 0 {
                return false
            }

        } catch _ {
            return false
        }

        return true
    }


}

extension String {

    func convertToBody1() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getBody1Attributes())

        return attributedString
    }

    func convertToBody1Dark() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getBody1DarkAttributes())

        return attributedString
    }

    func convertToBody1Error() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getBody1ErrorAttributes())

        return attributedString
    }

    func convertToBody1Colored() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getBody1ColoredAttributes())

        return attributedString
    }

    func convertToBody2() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getBody2Attributes())

        return attributedString
    }

    func convertToBody2Error() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getBody2ErrorAttributes())

        return attributedString
    }

    func convertToBody2Colored() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getBody2ColoredAttributes())

        return attributedString
    }

    func convertToHeader1() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getHeader1Attributes())

        return attributedString
    }

    func convertToHeader2() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getHeader2Attributes())

        return attributedString
    }

    func convertToHeader2Dark() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getHeader2DarkAttributes())

        return attributedString
    }

    func convertToHeader2Error() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes: Attributes.getHeader2ErrorAttributes())

        return attributedString
    }
}