//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit
import QuartzCore.CAGradientLayer

class BaseViewController: UIViewController {
    fileprivate lazy var loadingView: LoadingView = LoadingView()

    fileprivate var keyboardChangeObserver: KeyboardChangeObserver?


    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundLayer = CAGradientLayer()
        backgroundLayer.frame = self.view.bounds
        backgroundLayer.colors = [UIColor.mediumLightGrey.cgColor, UIColor.superDarkGrey.cgColor]
        view.layer.insertSublayer(backgroundLayer, at: 0)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }

    func hasNavigationBackButton() -> Bool {
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let destinationViewController = segue.destination as? BaseViewController {
            if !destinationViewController.hasNavigationBackButton(),
               let navigationItem = destinationViewController.navigationItem as? CustomNavigationItem {
                navigationItem.hideBackButton(hide: true, force: true, animate: true)
            }
        }
    }

    @objc func keyboardWillShow(notification: Notification) {
        keyboardChangeObserver?.keyboardWillShow(notification: notification)
    }

    @objc func keyboardWillHide(notification: Notification) {
        keyboardChangeObserver?.keyboardWillHide(notification: notification)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

    func startLoading() {
        disableNavigationBar(disable: true)
        loadingView.startLoading(parentView: view)
    }

    func stopLoading() {
        disableNavigationBar(disable: false)
        loadingView.stopLoading()
    }
}

//MARK: Utility methods

extension BaseViewController {

    func disableNavigationBar(disable: Bool) {
        if let navigationItem = navigationItem as? CustomNavigationItem {
            navigationItem.disable(disable: disable)
        }
    }
}

//MARK: ViewMask methods

extension BaseViewController: BaseViewMask {

    func setLoading(loading: Bool) {
        if loading {
            startLoading()
        } else {
            stopLoading()
        }
    }

    func performSegue(segue: Segue) {
        performSegue(withIdentifier: segue.rawValue, sender: self)
    }

    func popViewController(animated: Bool) {
        _ = navigationController?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
}
