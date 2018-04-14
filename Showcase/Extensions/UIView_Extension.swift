//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

//MARK: SubView methods

extension UIView {

    func fillWithView(view: UIView) {
        addSubview(view)

        alignViewToLeft(view: view)
        alignViewToTop(view: view)
        alignViewToRight(view: view)
        alignViewToBottom(view: view)
    }

    func alignViewToLeft(view: UIView, margin: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let leftConstraint = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: margin)
        addConstraint(leftConstraint)
    }

    func alignViewToTop(view: UIView, margin: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: margin)
        addConstraint(topConstraint)
    }

    func alignViewToRight(view: UIView, margin: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let rightConstraint = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: margin)
        addConstraint(rightConstraint)
    }

    func alignViewToBottom(view: UIView, margin: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let bottomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: margin)
        addConstraint(bottomConstraint)
    }

    func setViewY(view: UIView, y: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let yConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: y)
        addConstraint(yConstraint)
    }

    func centerViewVertically(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let centerConstraint = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        addConstraint(centerConstraint)
    }

    func centerViewHorizontally(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let centerConstraint = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        addConstraint(centerConstraint)
    }

    //Stack view helper methods used for iOS versions < 9.0

    func stackInnerViewsVertically(views: [UIView], margin: CGFloat = 0) {
        for i in 0...views.count - 1 {
            views[i].translatesAutoresizingMaskIntoConstraints = false

            if i + 1 < views.count {
                let aboveConstraint = NSLayoutConstraint(item: views[i + 1], attribute: .top, relatedBy: .equal, toItem: views[i], attribute: .bottom, multiplier: 1, constant: margin)
                addConstraint(aboveConstraint)
            }
        }
    }

    func stackInnerViewsHorizontally(views: [UIView]) {
        for i in 0...views.count - 1 {
            views[i].translatesAutoresizingMaskIntoConstraints = false

            if i + 1 < views.count {
                let aboveConstraint = NSLayoutConstraint(item: views[i + 1], attribute: .left, relatedBy: .equal, toItem: views[i], attribute: .right, multiplier: 1, constant: 0)
                addConstraint(aboveConstraint)
            }
        }
    }
}

//MARK: Helper methods

extension UIView {

    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
        addConstraint(heightConstraint)
    }

    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false

        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
        addConstraint(widthConstraint)
    }

    func setX(x: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false

        let xConstraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1, constant: x)
        superview?.addConstraint(xConstraint)
    }

    func setY(y: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false

        let yConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: y)
        superview?.addConstraint(yConstraint)
    }

    func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension UIView {

    func loadNib(nibName: String = String(describing: type(of: self))) {
        let nibView = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)![0]

        if let nibView = nibView as? UIView {
            fillWithView(view: nibView)
        }
    }
}

//MARK: Style

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 9.0
        layer.shadowOpacity = 0.7
        layer.masksToBounds = false
    }
}