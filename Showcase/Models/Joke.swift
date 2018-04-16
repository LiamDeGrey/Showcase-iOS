//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

struct Joke: Codable {
    let body: String

    private enum CodingKeys: String, CodingKey {
        case body = "joke"
    }
}

//MARK: Hashable

extension Joke: Hashable {
    var hashValue: Int {
        return body.hashValue
    }

    static func ==(lhs: Joke, rhs: Joke) -> Bool {
        return lhs.body == rhs.body
    }
}
