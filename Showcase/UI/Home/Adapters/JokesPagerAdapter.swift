//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit

protocol JokesPagerAdapterCallbacks: class {

    func onPageChanged(page: Int)

    func reloadJokes()

}

class JokesPagerAdapter: NSObject {
    fileprivate static let JOKES_PAGE_VIEW_MARGIN: CGFloat = 50

    fileprivate lazy var jokes = [Joke]()

    fileprivate weak var callbacks: JokesPagerAdapterCallbacks?

    init(callbacks: JokesPagerAdapterCallbacks) {
        self.callbacks = callbacks
    }

    func setJokes(_ jokes: [Joke]) {
        self.jokes.removeAll()
        self.jokes.append(contentsOf: jokes)
        callbacks?.reloadJokes()
    }
}

extension JokesPagerAdapter: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let joke = jokes[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.jokePageCell.rawValue, for: indexPath) as! JokePageCell

        cell.populateView(number: indexPath.row, joke: joke)

        return cell
    }
}

extension JokesPagerAdapter: UICollectionViewDelegateFlowLayout {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells {
                scaleCell(collectionView: collectionView, jokePageCell: cell)
            }
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        snapToCenter(collectionView: scrollView as! UICollectionView)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        snapToCenter(collectionView: scrollView as! UICollectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jokes.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: JokesPagerAdapter.JOKES_PAGE_VIEW_MARGIN, height: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: JokesPagerAdapter.JOKES_PAGE_VIEW_MARGIN, height: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - JokesPagerAdapter.JOKES_PAGE_VIEW_MARGIN * 2, height: collectionView.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        scaleCell(collectionView: collectionView, jokePageCell: cell)
    }
}

//MARK: Private methods

private extension JokesPagerAdapter {

    func scaleCell(collectionView: UICollectionView, jokePageCell: UICollectionViewCell) {
        let cellCenter = jokePageCell.superview!.convert(jokePageCell.center, to: collectionView.superview)
        let viewCenter = collectionView.superview!.center
        let centerOffset = abs(cellCenter.x - viewCenter.x)
        let maxScale: CGFloat = 1.0
        let minScale: CGFloat = 0.9

        let ratio = (maxScale - minScale) / viewCenter.x
        let scale = maxScale - (ratio * centerOffset)

        jokePageCell.transform = CGAffineTransform.init(scaleX: scale, y: scale)
    }

    func snapToCenter(collectionView: UICollectionView) {
        let centerPoint = collectionView.superview!.convert(collectionView.superview!.center, to: collectionView)
        if let centerIndexPath = collectionView.indexPathForItem(at: centerPoint) {
            collectionView.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
            callbacks?.onPageChanged(page: centerIndexPath.row)
        }
    }
}