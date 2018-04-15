//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

class SplashPresenter: BasePresenter {
    fileprivate let STANDARD_DISPLAY_TIME = 1.0
    fileprivate let ANIMATION_DISPLAY_TIME = 2.5

    weak var view: SplashViewMask?

    override func viewAppeared() {
        super.viewAppeared()

        delay(duration: STANDARD_DISPLAY_TIME, function: {
            self.startAnimationCountdown()
            self.startAnimation()
        })
    }

    override func viewDisappeared() {
        super.viewDisappeared()

        stopAnimation()
    }

    override func getViewMask() -> BaseViewMask? {
        return view
    }
}

//MARK: Private methods

private extension SplashPresenter {

    func startAnimationCountdown() {
        delay(duration: ANIMATION_DISPLAY_TIME, function: {
            self.showHomeController()
        })
    }
}

//MARK: ViewMask methods

private extension SplashPresenter {

    func startAnimation() {
        view?.startAnimation()
    }

    func stopAnimation() {
        view?.stopAnimation()
    }

    func showHomeController() {
        performSegue(segue: .splashToHome)
    }
}
