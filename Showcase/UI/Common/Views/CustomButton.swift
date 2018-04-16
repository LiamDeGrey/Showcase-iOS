//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

internal class CustomButton: UIButton {
    enum Style: Int {
        case primary, // 0
             secondary, // 1
             drawer // 2
    }

    @IBInspectable fileprivate var styleValue: Int = 0 {
        didSet {
            style = Style(rawValue: styleValue) ?? .primary
        }
    }

    var style: Style = .primary {
        didSet {
            switch style {
            case .primary:
                applyStylePrimary()
                break
            case .secondary:
                applyStyleSecondary()
                break
            case .drawer:
                applyStyleDrawer()
                break
            }
        }
    }

    private var leftIconView: UIImageView? = nil {
        willSet(newLeftIconView) {
            if newLeftIconView == nil, let leftIconView = leftIconView {
                leftIconView.removeFromSuperview()
            }
        }
        didSet {
            if let leftIconView = leftIconView {
                addSubview(leftIconView)
                alignViewToLeft(view: leftIconView, margin: Dimensions.padding_12)
                centerViewVertically(view: leftIconView)
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

    fileprivate var normalBackgroundColor: UIColor!
    fileprivate var normalBorderColor: UIColor!
    fileprivate var highlightedBackgroundColor: UIColor!
    fileprivate var highlightedBorderColor: UIColor!
    fileprivate var disabledBackgroundColor: UIColor!
    fileprivate var disabledBorderColor: UIColor!

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
        cornerRadius = Dimensions.cornerRadius
    }
}

//MARK: Applying styles

private extension CustomButton {

    func applyStylePrimary() {
        normalBackgroundColor = .skyBlue
        normalBorderColor = .black
        highlightedBackgroundColor = .clear
        highlightedBorderColor = .skyBlue
        disabledBackgroundColor = .lightGrey
        disabledBorderColor = .disabledGrey

        setTitleColor(.mediumGrey, for: .normal)
        setTitleColor(.skyBlue, for: .highlighted)
        setTitleColor(.disabledGrey, for: .disabled)

        titleLabel?.font = UIFont.body1Font()
        titleLabel?.textAlignment = .center

        leftIcon = nil

        contentHorizontalAlignment = .center

        updateState()
        updateInsets(horizontalPadding: Dimensions.padding_12, verticalPadding: Dimensions.padding_12)
    }

    func applyStyleSecondary() {
        normalBackgroundColor = .clear
        normalBorderColor = .skyBlue
        highlightedBackgroundColor = .skyBlue
        highlightedBorderColor = .black
        disabledBackgroundColor = .lightGrey
        disabledBorderColor = .disabledGrey

        setTitleColor(.skyBlue, for: .normal)
        setTitleColor(.black, for: .highlighted)
        setTitleColor(.disabledGrey, for: .disabled)

        titleLabel?.font = UIFont.body1Font()
        titleLabel?.textAlignment = .center

        leftIcon = nil

        contentHorizontalAlignment = .center

        updateState()
        updateInsets(horizontalPadding: Dimensions.padding_12, verticalPadding: Dimensions.padding_12)
    }

    func applyStyleDrawer() {
        normalBackgroundColor = .clear
        normalBorderColor = .clear
        highlightedBackgroundColor = .clear
        highlightedBorderColor = .clear
        disabledBackgroundColor = .clear
        disabledBorderColor = .clear

        setTitleColor(.lightGrey, for: .normal)
        setTitleColor(.skyBlue, for: .highlighted)
        setTitleColor(.mediumGrey, for: .disabled)

        titleLabel?.font = UIFont.body1Font()
        titleLabel?.textAlignment = .center

        leftIcon = nil

        contentHorizontalAlignment = .center

        updateState()
        updateInsets(horizontalPadding: Dimensions.padding_12, verticalPadding: Dimensions.padding_12)
    }

    func updateInsets(horizontalPadding: CGFloat, verticalPadding: CGFloat) {
        contentEdgeInsets = UIEdgeInsetsMake(verticalPadding, horizontalPadding, verticalPadding, horizontalPadding)
    }
}

//MARK: State updates

internal extension CustomButton {
    private enum State {
        case Disabled
        case Highlighted
        case Normal
    }

    override var isEnabled: Bool {
        didSet {
            updateState()
        }
    }

    override var isHighlighted: Bool {
        didSet {
            updateState()
        }
    }

    private func updateState() {
        let state = !isEnabled ? State.Disabled :
                isHighlighted ? State.Highlighted :
                        State.Normal

        switch state {
        case .Disabled:
            backgroundColor = disabledBackgroundColor
            borderColor = disabledBorderColor
            break
        case .Highlighted:
            backgroundColor = highlightedBackgroundColor
            borderColor = highlightedBorderColor
            break
        case .Normal:
            backgroundColor = normalBackgroundColor
            borderColor = normalBorderColor
            break
        }
    }
}
