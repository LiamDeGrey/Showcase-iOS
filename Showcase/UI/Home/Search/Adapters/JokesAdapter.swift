//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

protocol JokesAdapterCallbacks: class {

    func reloadTableView()

}

class JokesAdapter: NSObject {
    fileprivate var jokes = [Joke]()

    fileprivate weak var callbacks: JokesAdapterCallbacks?

    init(callbacks: JokesAdapterCallbacks) {
        self.callbacks = callbacks
    }

    func updateJokes(jokes: [Joke]) {
        self.jokes.removeAll()
        self.jokes.append(contentsOf: jokes)
        callbacks?.reloadTableView()
    }
}

extension JokesAdapter: UITableViewDataSource, UITableViewDelegate {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = ReuseIdentifier.jokeCell.rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JokeCell

        let joke = jokes[indexPath.row]

        cell.populateView(number: indexPath.row, joke: joke)

        return cell
    }
}