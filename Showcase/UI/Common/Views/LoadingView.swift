//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class LoadingView: BaseUIView {
    @IBOutlet fileprivate weak var spinnerView: UIActivityIndicatorView!


    override func commonInit() {
        super.commonInit()

        spinnerView.color = UIColor.blue
    }
}

//MARK: Loading methods

extension LoadingView {

    func startLoading(parentView: UIView) {
        spinnerView.startAnimating()
        parentView.fillWithView(view: self)
    }

    func stopLoading() {
        spinnerView.stopAnimating()
        removeFromSuperview()
    }
}