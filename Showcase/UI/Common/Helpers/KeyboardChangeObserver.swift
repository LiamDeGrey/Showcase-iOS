//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import Foundation

protocol KeyboardChangeObserver {

    func keyboardWillShow(notification: Notification)

    func keyboardWillHide(notification: Notification)
}