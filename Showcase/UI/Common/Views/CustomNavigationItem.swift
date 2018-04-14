//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class CustomNavigationItem: UINavigationItem {
    fileprivate var forceHideBackButton = false

    func disable(disable: Bool) {
        hideBackButton(hide: disable, force: false, animate: false)

        if let rightBarButtonItems = rightBarButtonItems {
            for barButtonItem in rightBarButtonItems {
                barButtonItem.isEnabled = !disable
            }
        }

        if let leftBarButtonItems = leftBarButtonItems {
            for barButtonItem in leftBarButtonItems {
                barButtonItem.isEnabled = !disable
            }
        }
    }

    func hideBackButton(hide: Bool, force: Bool, animate: Bool) {
        if (hide) {
            if (force) {
                forceHideBackButton = true
            }
            setHidesBackButton(hide, animated: animate)
        } else {
            if (force || !forceHideBackButton) {
                setHidesBackButton(hide, animated: animate)
            }
        }
    }
}