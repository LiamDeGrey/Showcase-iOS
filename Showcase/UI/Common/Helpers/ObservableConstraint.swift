//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

protocol ObservableConstraintCallbacks: class {

    func onConstraintConstantChanged(value: CGFloat)
}

class ObservableConstraint: NSLayoutConstraint {
    override var constant: CGFloat {
        didSet {
            callbacks?.onConstraintConstantChanged(value: constant)
        }
    }

    weak var callbacks: ObservableConstraintCallbacks?
}