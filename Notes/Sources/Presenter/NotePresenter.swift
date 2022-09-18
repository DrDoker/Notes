//
//  NotePresenter.swift
//  Notes
//
//  Created by Serhii  on 18/09/2022.
//

import Foundation

protocol NotePresenterProtocol: AnyObject {
    func getTitle() -> String
    func getText() -> String
}

class NotePresenter: NotePresenterProtocol {
    weak var view: NoteViewController?
    var router: RouterProtocol?
    private let note: Note?

    required init(view: NoteViewController, note: Note?, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.note = note
    }

    func getTitle() -> String {
        return note?.title ?? ""
    }

    func getText() -> String {
        return note?.text ?? ""
    }
}
