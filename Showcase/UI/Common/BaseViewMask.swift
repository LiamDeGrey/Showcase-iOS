//
// Created by Liam De Grey on 14/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

protocol BaseViewMask: class {

    func setLoading(loading: Bool)

    func performSegue(segue: Segue)

    func popViewController(animated: Bool)

    func popToRoot(animated: Bool)
}