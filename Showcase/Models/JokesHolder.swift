//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

struct JokesHolder: Codable {
    let jokes: [Joke]

    private enum CodingKeys: String, CodingKey {
        case jokes = "results"
    }
}

//MARK: Hashable

extension JokesHolder: Hashable {
    var hashValue: Int {
        var tempHashValue = 0

        jokes.forEach({ joke in
            tempHashValue ^= joke.hashValue
        })

        return tempHashValue
    }

    static func ==(lhs: JokesHolder, rhs: JokesHolder) -> Bool {
        return lhs.jokes == rhs.jokes
    }
}