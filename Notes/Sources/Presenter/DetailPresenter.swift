//
//  DetailPresenter.swift
//  mvp_testApp
//
//  Created by Serhii  on 17/09/2022.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var note: Note? { get }

    init(view: DetailViewController, note: Note?, router: RouterProtocol)
    func showMenu()
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewController?
    var router: RouterProtocol?
    let note: Note?

    required init(view: DetailViewController, note: Note?, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.note = note
    }

    func showMenu() {
        router?.popToRoot()
    }
}
