//
//  NotePresenter.swift
//  Notes
//
//  Created by Serhii  on 18/09/2022.
//

import Foundation

protocol NoteViewProtocol: AnyObject {
    // Any function
}

protocol NotePresenterProtocol: AnyObject {
    func getTitle() -> String
    func getText() -> String
}

class NotePresenter: NotePresenterProtocol {
    weak var view: NoteViewProtocol?
    var router: RouterProtocol?
    private let note: Note?

    required init(view: NoteViewProtocol, note: Note?, router: RouterProtocol) {
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
