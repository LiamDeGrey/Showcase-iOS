//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import Foundation
import RxSwift

class BasePresenter: NSObject {
    private (set) lazy var disposeBag = DisposeBag()

    private(set) var isVisible = false
    private(set) var isFirstLoad = true


    func viewLoaded() {
        isFirstLoad = false
    }

    func viewDestroyed() {
    }

    func viewAppeared() {
        isVisible = true
    }

    func viewDisappeared() {
        isVisible = false
    }

    func getViewMask() -> BaseViewMask? {
        preconditionFailure("This method must be overridden")
    }
}

//MARK: Utility functions

extension BasePresenter {

    func delay(duration: Double, function: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            function()
        }
    }
}

//MARK: Private methods

private extension BasePresenter {

}

//MARK: ViewMask methods

extension BasePresenter {

    func setLoading(loading: Bool) {
        getViewMask()?.setLoading(loading: loading)
    }

    func performSegue(segue: Segue) {
        getViewMask()?.performSegue(segue: segue)
    }

    func popViewController(animated: Bool) {
        getViewMask()?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool) {
        getViewMask()?.popToRoot(animated: animated)
    }
}