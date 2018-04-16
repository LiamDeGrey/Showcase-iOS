//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet fileprivate weak var drawerView: DrawerView!
    @IBOutlet fileprivate weak var jokesPager: UICollectionView!
    @IBOutlet fileprivate weak var jokesPagerIndicator: UIPageControl!

    fileprivate lazy var jokesPagerAdapter = JokesPagerAdapter(callbacks: self)

    fileprivate let presenter = HomePresenter()


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        presenter.view = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupJokesPager()

        presenter.viewLoaded()
    }

    deinit {
        presenter.viewDestroyed()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        drawerView.setup(with: self)

        presenter.viewAppeared()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        drawerView.closeDrawer()

        presenter.viewDisappeared()
    }

    override func hasNavigationBackButton() -> Bool {
        return false
    }
}

extension HomeViewController: DrawerViewCallbacks {

    func onAboutClicked() {
        presenter.handleAboutClicked()
    }

    func onAcknowledgementsClicked() {
        presenter.handleAcknowledgementsClicked()
    }

    func onLikedTheSplashClicked() {
        presenter.handleLikedTheSplashClicked()
    }
}

//MARK: jokesPager methods

extension HomeViewController: JokesPagerAdapterCallbacks {

    func onPageChanged(page: Int) {
        jokesPagerIndicator.currentPage = page
    }

    func reloadJokes() {
        jokesPager.reloadData()
    }
}

//MARK: Private methods

private extension HomeViewController {

    @IBAction func onMenuClicked(_ sender: Any) {
        drawerView.toggleDrawer()
    }

    func setupJokesPager() {
        jokesPager.decelerationRate = UIScrollViewDecelerationRateFast
        jokesPager.dataSource = jokesPagerAdapter
        jokesPager.delegate = jokesPagerAdapter
        jokesPagerIndicator.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
    }
}

//MARK: ViewMask methods

extension HomeViewController: HomeViewMask {

    func setJokes(_ jokes: [Joke]) {
        jokesPagerAdapter.setJokes(jokes)
        jokesPagerIndicator.numberOfPages = jokes.count
    }
}