//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    fileprivate let presenter = SplashPresenter()

    @IBOutlet weak var animatedLabel: CustomLabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        presenter.view = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewLoaded()
    }

    deinit {
        presenter.viewDestroyed()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter.viewAppeared()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        presenter.viewDisappeared()
    }

    override func hasNavigationBackButton() -> Bool {
        return false
    }
}

//MARK: ViewMask methods

extension SplashViewController: SplashViewMask {

}
