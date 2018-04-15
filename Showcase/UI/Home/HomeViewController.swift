//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet fileprivate weak var drawerView: DrawerView!

    fileprivate let presenter = HomePresenter()


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

        drawerView.setup(with: self)

        presenter.viewAppeared()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        drawerView.closeDrawer()

        presenter.viewDisappeared()
    }

    override func hasNavigationBackButton() -> Bool {
        return false
    }
}

extension HomeViewController: DrawerViewCallbacks {

    func onAboutClicked() {
        presenter.handleAboutClicked()
    }

    func onAcknowledgementsClicked() {
        presenter.handleAcknowledgementsClicked()
    }

    func onLikedTheSplashClicked() {
        presenter.handleLikedTheSplashClicked()
    }
}

//MARK: Private methods

private extension HomeViewController {

    @IBAction func onMenuClicked(_ sender: Any) {
        drawerView.toggleDrawer()
    }
}

//MARK: ViewMask methods

extension HomeViewController: HomeViewMask {

}
