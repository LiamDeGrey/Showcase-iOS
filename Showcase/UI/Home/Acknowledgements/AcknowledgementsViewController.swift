//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import WebKit

class AcknowledgementsViewController: BaseViewController {
    @IBOutlet fileprivate weak var webView: WKWebView!

    fileprivate let presenter = AcknowledgementsPresenter()


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

        webView.stopLoading()
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

private extension AcknowledgementsViewController {

}

//MARK: ViewMask methods

extension AcknowledgementsViewController: AcknowledgementsViewMask {

    func setWebUrl(url: URL) {
        webView.load(URLRequest(url: url))
    }

}
