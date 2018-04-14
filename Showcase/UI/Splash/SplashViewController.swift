//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import UIKit
import CoreMotion

class SplashViewController: BaseViewController {
    fileprivate let presenter = SplashPresenter()

    @IBOutlet fileprivate var animationLabels: [CustomLabel]!

    fileprivate var animator: UIDynamicAnimator!
    fileprivate var gravityBehavior: UIGravityBehavior!
    fileprivate lazy var motionQueue = OperationQueue()
    fileprivate lazy var motionManager = CMMotionManager()


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        presenter.view = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        createAnimation()

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

    override func hasNavigationBackButton() -> Bool {
        return false
    }
}

//MARK: Private methods

private extension SplashViewController {

    func createAnimation() {
        animator = UIDynamicAnimator(referenceView: view)
        gravityBehavior = UIGravityBehavior(items: animationLabels)

        let collisionBehavior = UICollisionBehavior(items: animationLabels)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)

        animationLabels.forEach({ label in
            let bouncyBehavior = UIDynamicItemBehavior(items: [label])
            bouncyBehavior.allowsRotation = true
            bouncyBehavior.angularResistance = CGFloat(arc4random_uniform(2))
            bouncyBehavior.density = CGFloat(arc4random_uniform(2))
            bouncyBehavior.elasticity = CGFloat(arc4random_uniform(1))
            bouncyBehavior.friction = CGFloat(arc4random_uniform(1))
            bouncyBehavior.resistance = CGFloat(arc4random_uniform(2))
            animator.addBehavior(bouncyBehavior)
        })
    }
}

//MARK: ViewMask methods

extension SplashViewController: SplashViewMask {

    func startAnimation() {
        animator.addBehavior(gravityBehavior)

        motionManager.startDeviceMotionUpdates(to: motionQueue,
                withHandler: { motion, error in
                    let gravity: CMAcceleration = motion!.gravity;
                    self.gravityBehavior.gravityDirection = CGVector(dx: gravity.x, dy: -gravity.y)
                })
    }

    func stopAnimation() {
        animator.removeBehavior(gravityBehavior)

        motionManager.stopDeviceMotionUpdates()
    }
}
