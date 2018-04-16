//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class HomePresenter: BasePresenter {
    fileprivate lazy var jokesBroker = JokesBroker.instance

    weak var view: HomeViewMask?

    override func viewLoaded() {
        super.viewLoaded()

        setLoading(loading: true)
        jokesBroker.getRandomJokes(amount: Int(arc4random_uniform(6) + 4))//between 4 and 10
                .subscribeOn(ConcurrentDispatchQueueScheduler(queue: DispatchQueue(label: "Background", qos: .background)))
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { [weak self] jokesHolder in
                    var shuffledJokes = jokesHolder.jokes
                    shuffledJokes.shuffle()
                    self?.setJokes(shuffledJokes)
                    self?.setLoading(loading: false)
                }, onError: { [weak self] (_) in
                    self?.setJokes([Joke]())
                    self?.setLoading(loading: false)
                })
                .disposed(by: disposeBag)
    }

    override func getViewMask() -> BaseViewMask? {
        return view
    }
}

//MARK: Presenter methods

extension HomePresenter {

    func handleAboutClicked() {
        performSegue(segue: Segue.homeToAbout)
    }

    func handleAcknowledgementsClicked() {
        performSegue(segue: Segue.homeToAcknowledgements)
    }

    func handleLikedTheSplashClicked() {
        performSegue(segue: Segue.homeToSplash)
    }
}

//MARK: Private methods

private extension HomePresenter {

}

//MARK: ViewMask methods

private extension HomePresenter {

    func setJokes(_ jokes: [Joke]) {
        view?.setJokes(jokes)
    }
}