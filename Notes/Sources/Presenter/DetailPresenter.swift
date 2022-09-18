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
    func getTitle(for index: IndexPath) -> String
    func getText(for index: IndexPath) -> String
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

    func getTitle(for index: IndexPath) -> String {
        return folder?.folder[index.row].title ?? ""
    }

    func getText(for index: IndexPath) -> String {
        return folder?.folder[index.row].text ?? ""
    }

    func showNote(data: Note?) {
        router?.showNote(note: data)
    }
}
