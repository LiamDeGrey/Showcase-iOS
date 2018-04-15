//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

internal class CustomLabel: UILabel {
    enum Style: Int {
        case body1 = 0,
             body1Dark = 1,
             body1Error = 2,
             body1Colored = 3,

             body2 = 10,
             body2Error = 11,
             body2Colored = 12,

             header1 = 20,

             header2 = 30,
             header2Dark = 31,
             header2Error = 32,

             link = 40
    }

    @IBInspectable fileprivate var styleValue: Int = 0 {
        didSet {
            style = Style(rawValue: styleValue) ?? .body1
        }
    }

    var style: Style = .body1 {
        didSet {
            applyStyle()
        }
    }
    override var text: String? {
        didSet {
            applyStyle()
        }
    }
}

private extension CustomLabel {

    func applyStyle() {
        switch style {
        case .body1:
            applyStyleBody1()
            break
        case .body1Dark:
            applyStyleBody1Dark()
            break
        case .body1Error:
            applyStyleBody1Error()
            break
        case .body1Colored:
            applyStyleBody1Colored()
            break
        case .body2:
            applyStyleBody2()
            break
        case .body2Error:
            applyStyleBody2Error()
            break
        case .body2Colored:
            applyStyleBody2Colored()
            break
        case .header1:
            applyStyleHeader1()
            break
        case .header2:
            applyStyleHeader2()
            break
        case .header2Dark:
            applyStyleHeader2Dark()
            break
        case .header2Error:
            applyStyleHeader2Error()
            break
        case .link:
            applyStyleLink()
            break
        }
    }

    func applyStyleBody1() {
        attributedText = text?.convertToBody1()
    }

    func applyStyleBody1Dark() {
        attributedText = text?.convertToBody1Dark()
    }

    func applyStyleBody1Error() {
        attributedText = text?.convertToBody1Error()
    }

    func applyStyleBody1Colored() {
        attributedText = text?.convertToBody1Colored()
    }

    func applyStyleBody2() {
        attributedText = text?.convertToBody2()
    }

    func applyStyleBody2Error() {
        attributedText = text?.convertToBody2Error()
    }

    func applyStyleBody2Colored() {
        attributedText = text?.convertToBody2Colored()
    }

    func applyStyleHeader1() {
        attributedText = text?.convertToHeader1()
    }

    func applyStyleHeader2() {
        attributedText = text?.convertToHeader2()
    }

    func applyStyleHeader2Dark() {
        attributedText = text?.convertToHeader2Dark()
    }

    func applyStyleHeader2Error() {
        attributedText = text?.convertToHeader2Error()
    }

    func applyStyleLink() {
        attributedText = text?.convertToLink()
    }
}