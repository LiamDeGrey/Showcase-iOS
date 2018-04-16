//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    @IBOutlet fileprivate weak var searchInput: CustomTextField!
    @IBOutlet fileprivate weak var noContentView: CustomLabel!
    @IBOutlet fileprivate weak var inlineLoadingView: InlineLoadingView!
    @IBOutlet fileprivate weak var jokesList: UITableView!

    fileprivate lazy var jokesAdapter = JokesAdapter(callbacks: self)

    fileprivate let presenter = SearchPresenter()


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        presenter.view = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        jokesList.dataSource = jokesAdapter
        jokesList.delegate = jokesAdapter
        jokesList.estimatedRowHeight = 50.0
        jokesList.rowHeight = UITableViewAutomaticDimension

        presenter.setupTextWatcher(textInput: searchInput)

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

    override func startLoading() {
        noContentView.isHidden = true
        jokesList.isHidden = true
        inlineLoadingView.startLoading()
    }

    override func stopLoading() {
        inlineLoadingView.stopLoading()
    }
}

extension SearchViewController: JokesAdapterCallbacks {

    func reloadTableView() {
        jokesList.reloadData()
    }
}

//MARK: ViewMask methods

extension SearchViewController: SearchViewMask {

    func updateJokes(_ jokes: [Joke]) {
        jokesAdapter.updateJokes(jokes: jokes)

        noContentView.isHidden = searchInput.text!.isEmpty || !jokes.isEmpty
        jokesList.isHidden = !noContentView.isHidden
    }
}
