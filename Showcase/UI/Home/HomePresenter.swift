//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

class HomePresenter: BasePresenter {
    weak var view: HomeViewMask?


    override func getViewMask() -> BaseViewMask? {
        return view
    }
}

//MARK: Presenter methods

extension HomePresenter {

    func handleAboutClicked() {
        performSegue(segue: Segue.homeToAbout)
    }

    func handleAcknowledgementsClicked() {
        performSegue(segue: Segue.homeToAcknowledgements)
    }

    func handleLikedTheSplashClicked() {
        performSegue(segue: Segue.homeToSplash)
    }
}

//MARK: Private methods

private extension HomePresenter {

}

//MARK: ViewMask methods

private extension HomePresenter {

}