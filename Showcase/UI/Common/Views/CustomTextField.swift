//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

internal class CustomTextField: UITextField {
    enum Style: Int {
        case search = 0
    }

    @IBInspectable fileprivate var styleValue: Int = 0 {
        didSet {
            style = Style(rawValue: styleValue)!
        }
    }

    var style: Style! {
        didSet {
            switch style {
            case .search:
                applyStyleSearch()
                break
            default:
                break
            }
        }
    }

    private var leftIconView: UIImageView? = nil {
        willSet(newLeftIconView) {
            if newLeftIconView == nil, let leftIconView = leftIconView {
                leftIconView.removeFromSuperview()
                insetsHorizontal = Dimensions.padding_12
            }
        }
        didSet {
            if let leftIconView = leftIconView {
                addSubview(leftIconView)
                alignViewToLeft(view: leftIconView, margin: Dimensions.padding_12)
                centerViewVertically(view: leftIconView)
                insetsHorizontal = leftIconView.frame.width + Dimensions.padding_24
            }
        }
    }

    fileprivate var leftIcon: UIImage? = nil {
        didSet {
            if let leftIcon = leftIcon {
                leftIconView = UIImageView(image: leftIcon)
            } else {
                leftIconView = nil
            }
        }
    }

    override var placeholder: String? {
        didSet {
            attributedPlaceholder = placeholder?.convertToBody1()
        }
    }

    fileprivate var insetsHorizontal = Dimensions.padding_12
    fileprivate var insetsVertical = Dimensions.padding_12

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    private func commonInit() {
        borderWidth = Dimensions.strokeWidth
        borderColor = UIColor.darkGrey

        backgroundColor = UIColor.mediumGrey
        borderStyle = .line
        cornerRadius = Dimensions.cornerRadius

        font = UIFont.body1Font()
        textColor = UIColor.lightGrey
        tintColor = UIColor.skyBlue

        keyboardAppearance = .dark
        clearButtonMode = .always
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: insetsVertical, left: insetsHorizontal, bottom: insetsVertical, right: insetsHorizontal))
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: insetsVertical, left: insetsHorizontal, bottom: insetsVertical, right: insetsHorizontal))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: insetsVertical, left: insetsHorizontal, bottom: insetsVertical, right: insetsHorizontal))
    }
}

private extension CustomTextField {

    func applyStyleSearch() {
        autocapitalizationType = .words
        autocorrectionType = .yes
        spellCheckingType = .yes
        placeholder = "search_searchHint".localized

        leftIcon = UIImage(imageLiteralResourceName: "ic_search")
    }
}