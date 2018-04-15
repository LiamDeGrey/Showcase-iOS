//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

@objc protocol DrawerViewCallbacks: class {

    func onAboutClicked()

    func onAcknowledgementsClicked()

    func onLikedTheSplashClicked()

}

class DrawerView: BaseUIView {
    @IBOutlet fileprivate var rootView: UIView!
    @IBOutlet fileprivate weak var backgroundView: UIView!
    @IBOutlet fileprivate weak var stretchView: UIView!
    @IBOutlet fileprivate weak var menuView: UIView!

    @IBOutlet fileprivate weak var contentView: UIView!

    @IBOutlet fileprivate var openDrawerGestureRecognizer: UIScreenEdgePanGestureRecognizer!
    @IBOutlet fileprivate var closeDrawerGestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet fileprivate var backgroundClickedRecognizer: UITapGestureRecognizer!

    @IBOutlet fileprivate weak var menuViewLeadingConstraint: ObservableConstraint!

    weak var callbacks: DrawerViewCallbacks!

    fileprivate var openingDrawer = true


    override func commonInit() {
        super.commonInit()

        stretchView.isHidden = true
        isHidden = true

        menuViewLeadingConstraint.callbacks = self
    }

    func setup(with callbacks: DrawerViewCallbacks) {
        self.callbacks = callbacks

        contentView.addGestureRecognizer(openDrawerGestureRecognizer)

        menuViewLeadingConstraint.constant = -frame.width
        stretchView.isHidden = false
        isHidden = false
        rootView.isUserInteractionEnabled = false
    }
}

extension DrawerView: ObservableConstraintCallbacks {

    func onConstraintConstantChanged(value: CGFloat) {
        let ratio = 1.0 / menuView.frame.width
        let alpha = 1.0 - abs(min(value, 0)) * ratio

        if let backgroundView = backgroundView {
            backgroundView.alpha = alpha
            rootView.isUserInteractionEnabled = alpha == 1.0
        }
    }
}

//MARK: Public methods

extension DrawerView {

    func toggleDrawer() {
        snapDrawer(open: menuViewLeadingConstraint.constant < 0)
    }

    func closeDrawer() {
        snapDrawer(open: false)
    }
}

//MARK: Private methods

private extension DrawerView {

    @IBAction func onAboutClicked(_ sender: Any) {
        callbacks.onAboutClicked()
    }

    @IBAction func onAcknowledgementsClicked(_ sender: Any) {
        callbacks.onAcknowledgementsClicked()
    }

    @IBAction func onLikedTheSplashClicked(_ sender: Any) {
        callbacks.onLikedTheSplashClicked()
    }

    @IBAction func onDrawerSwiping(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)

        var translationMultiplier: CGFloat = 1.0
        if (menuViewLeadingConstraint.constant > 0) {
            let ratio = 1.0 / menuView.frame.width
            translationMultiplier = max(1.0 - ratio * (menuViewLeadingConstraint.constant / 0.2), 0)
        }

        menuViewLeadingConstraint.constant = menuViewLeadingConstraint.constant + translationMultiplier * translation.x
        sender.setTranslation(CGPoint.zero, in: self)

        if (translation.x > 0) {
            openingDrawer = true
        } else if (translation.x < 0) {
            openingDrawer = false
        }

        if (sender.state == .ended) {
            snapDrawer()
        }
    }

    @IBAction func onBackgroundTapped(_ sender: Any) {
        snapDrawer(open: false)
    }

    func snapDrawer() {
        if (!openingDrawer) {
            snapDrawer(open: menuViewLeadingConstraint.constant >= -menuView.frame.width * 0.25)
        } else {
            snapDrawer(open: menuViewLeadingConstraint.constant > -menuView.frame.width * 0.75)
        }
    }

    func snapDrawer(open: Bool) {
        menuViewLeadingConstraint.constant = open ? 0 : -menuView.frame.width

        UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: open ? 0.6 : 0.9,
                initialSpringVelocity: open ? 2.0 : 0,
                options: .allowUserInteraction,
                animations: {
                    self.layoutIfNeeded()
                })
    }
}
