//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import Foundation

class AcknowledgementsPresenter: BasePresenter {
    weak var view: AcknowledgementsViewMask?

    override func viewLoaded() {
        super.viewLoaded()

        setWebViewUrl(url: Bundle.main.url(forResource: "licenses", withExtension: "html")!)
    }

    override func getViewMask() -> BaseViewMask? {
        return view
    }
}

//MARK: Private methods

private extension AcknowledgementsPresenter {

}

//MARK: ViewMask methods

private extension AcknowledgementsPresenter {

    func setWebViewUrl(url: URL) {
        view?.setWebUrl(url: url)
    }

}