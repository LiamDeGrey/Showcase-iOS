//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class InlineLoadingView: BaseUIView {
    @IBOutlet fileprivate weak var spinnerView: UIActivityIndicatorView!


    override func commonInit() {
        super.commonInit()

        spinnerView.color = UIColor.skyBlue
    }
}

//MARK: Loading methods

extension InlineLoadingView {

    func startLoading() {
        spinnerView.startAnimating()
        isHidden = false
    }

    func stopLoading() {
        spinnerView.stopAnimating()
        isHidden = true
    }
}