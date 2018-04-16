//
// Created by Liam De Grey on 15/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import RxCocoa
import RxSwift

class SearchPresenter: BasePresenter {
    fileprivate lazy var jokesBroker = JokesBroker.instance

    weak var view: SearchViewMask?


    override func getViewMask() -> BaseViewMask? {
        return view
    }
}

//MARK: Presenter methods

extension SearchPresenter {

    func setupTextWatcher(textInput: CustomTextField) {
        textInput.rx.text.orEmpty
                .debounce(0.5, scheduler: MainScheduler.instance)
                .distinctUntilChanged()
                .subscribe(onNext: { [unowned self] query in
                    self.searchWithTerm(term: query)
                })
                .disposed(by: disposeBag)
    }
}

//MARK: Private methods

private extension SearchPresenter {

    func searchWithTerm(term: String?) {
        if let searchTerm = term, !searchTerm.isEmpty {
            setLoading(loading: true)
            jokesBroker.searchForJokes(term: searchTerm)
                    .subscribeOn(ConcurrentDispatchQueueScheduler(queue: DispatchQueue(label: "Background", qos: .background)))
                    .observeOn(MainScheduler.instance)
                    .subscribe(onNext: { [weak self] jokesHolder in
                        self?.updateJokes(jokesHolder.jokes)
                        self?.setLoading(loading: false)
                    }, onError: { [weak self] (_) in
                        self?.updateJokes([Joke]())
                        self?.setLoading(loading: false)
                    })
                    .disposed(by: disposeBag)
        } else {
            updateJokes([Joke]())
        }
    }
}

//MARK: ViewMask methods

private extension SearchPresenter {

    func updateJokes(_ jokes: [Joke]) {
        view?.updateJokes(jokes)
    }
}