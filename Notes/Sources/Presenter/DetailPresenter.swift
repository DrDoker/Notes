//
//  DetailPresenter.swift
//  mvp_testApp
//
//  Created by Serhii  on 17/09/2022.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var folder: NotesFolder? { get }

    init(view: DetailViewController, folder: NotesFolder?, router: RouterProtocol)
    func getNumberOfRow() -> Int
    func showNote(data: Note?)
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewController?
    var router: RouterProtocol?
    let folder: NotesFolder?

    required init(view: DetailViewController, folder: NotesFolder?, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.folder = folder
    }

    func getNumberOfRow() -> Int {
        folder?.countNotes ?? 0
    }

    func showNote(data: Note?) {
        router?.showNote(note: data)
    }
}
