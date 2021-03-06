//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {
    fileprivate let presenter = AboutPresenter()

    @IBOutlet fileprivate weak var emailLabel: CustomLabel!

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
}

//MARK: Private methods

private extension AboutViewController {

    @IBAction func onEmailClicked(_ sender: Any) {
        presenter.handleEmailClicked(email: emailLabel?.text)
    }
}

//MARK: ViewMask methods

extension AboutViewController: AboutViewMask {

}
