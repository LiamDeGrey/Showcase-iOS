//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

class AboutPresenter: BasePresenter {
    weak var view: AboutViewMask?


    override func getViewMask() -> BaseViewMask? {
        return view
    }
}

//MARK: Presenter methods

extension AboutPresenter {

    func handleEmailClicked(email: String?) {
        email?.emailUrl?.open()
    }
}

//MARK: Private methods

private extension AboutPresenter {

}

//MARK: ViewMask methods

private extension AboutPresenter {

}