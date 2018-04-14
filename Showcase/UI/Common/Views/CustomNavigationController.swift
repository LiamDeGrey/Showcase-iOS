//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func awakeFromNib() {
        super.awakeFromNib()

        navigationBar.setShadow()
    }
}