//
//  NotePresenter.swift
//  Notes
//
//  Created by Serhii  on 18/09/2022.
//

import Foundation

protocol NoteViewProtocol: AnyObject {
    func setupNote(with title: String, and text: String)
}

protocol NotePresenterProtocol: AnyObject {
    func getData()
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
    
    func getData() {
        let title = note?.title ?? ""
        let text = note?.text ?? ""
        self.view?.setupNote(with: title, and: text)
    }
}
