//
//  Presenter.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var notes: [NotesGroup] { get }
    
    init(view: MenuViewController, notes: [NotesGroup], router: RouterProtocol)
    func getNumberOfSections() -> Int
    func getNumberOfRow(section: Int) -> Int
    func showDetail(data: Note?)
}

class Presenter: MainPresenterProtocol {
    
    weak var view: MenuViewController?
    var router: RouterProtocol?
    let notes: [NotesGroup]
    
    required init(view: MenuViewController, notes: [NotesGroup], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.notes = notes
    }
    
    func getNumberOfSections() -> Int {
        notes.count
    }
    
    func getNumberOfRow(section: Int) -> Int {
        notes[section].group.count
    }
    
    func showDetail(data: Note?) {
        router?.showDetail(note: data)
    }
}
