//
//  DetailPresenter.swift
//  mvp_testApp
//
//  Created by Serhii  on 17/09/2022.
//

import Foundation

protocol FolderPresenterProtocol: AnyObject {
    func getNumberOfRow() -> Int
    func getTitle(for index: IndexPath) -> String
    func getText(for index: IndexPath) -> String
    func getFolderTitle() -> String
    func showNote(index: IndexPath)
}

class FolderPresenter: FolderPresenterProtocol {
    weak var view: FolderViewController?
    var router: RouterProtocol?
    private let folder: NotesFolder?

    required init(view: FolderViewController, folder: NotesFolder?, router: RouterProtocol) {
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

    func getFolderTitle() -> String {
        return folder?.title ?? ""
    }

    func showNote(index: IndexPath) {
        let note = folder?.folder[index.row]
        router?.showNote(note: note)
    }
}
