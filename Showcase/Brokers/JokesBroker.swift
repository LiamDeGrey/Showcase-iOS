//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import Foundation
import RxSwift

class JokesBroker: BaseHttpBroker {
    lazy var baseUrl: URL = URL(string: Bundle.main.infoDictionary!["JOKES_API_HOST"] as! String)!

    static let instance = JokesBroker()

    private init() {
    }

    func getRandomJokes(amount: Int, page: Int = 1) -> Observable<JokesHolder> {
        return get(from: "search", headers: ["Accept": "application/json"], parameters: ["limit": String(amount), "page": String(page)])
    }

    func searchForJokes(term: String, amount: Int = 30, page: Int = 1) -> Observable<JokesHolder> {
        return get(from: "search", headers: ["Accept": "application/json"], parameters: ["term": term, "limit": String(amount), "page": String(page)])
    }
}