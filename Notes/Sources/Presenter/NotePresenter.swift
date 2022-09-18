//
//  NotePresenter.swift
//  Notes
//
//  Created by Serhii  on 18/09/2022.
//

import Foundation

protocol NotePresenterProtocol: AnyObject {
    var note: Note? { get }

    init(view: NoteViewController, note: Note?, router: RouterProtocol)
}

class NotePresenter: NotePresenterProtocol {
    weak var view: NoteViewController?
    var router: RouterProtocol?
    let note: Note?

    required init(view: NoteViewController, note: Note?, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.note = note
    }
}
