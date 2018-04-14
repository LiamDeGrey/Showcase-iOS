//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import Foundation

extension NSAttributedString {

    var mutable: NSMutableAttributedString {
        return mutableCopy() as! NSMutableAttributedString
    }

    func getAttributes() -> [NSAttributedStringKey: Any] {
        return attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: length))
    }
}