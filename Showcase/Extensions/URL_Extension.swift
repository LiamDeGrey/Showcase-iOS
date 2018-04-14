//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

extension URL {

    func open() {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(self, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(self)
        }
    }
}