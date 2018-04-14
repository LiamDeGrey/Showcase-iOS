//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

class SplashPresenter: BasePresenter {
    weak var view: SplashViewMask?

    override func viewAppeared() {
        super.viewAppeared()

        delay(duration: 2, function: {
            self.showHomeController()
        })
    }

    override func getViewMask() -> BaseViewMask? {
        return view
    }
}

//MARK: ViewMask methods

private extension SplashPresenter {

    func showHomeController() {
        performSegue(segue: .splashToHome)
    }
}
