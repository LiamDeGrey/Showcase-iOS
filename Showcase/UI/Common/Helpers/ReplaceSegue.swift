//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class ReplaceSegue: UIStoryboardSegue {

    override func perform() {
        if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate,
           let window = appDelegate.window {
            UIView.transition(with: window, duration: 0.5, animations: {
                window.rootViewController = self.destination
            })
        }
    }
}