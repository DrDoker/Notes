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
    func getTitle(for imdex: IndexPath) -> String
    func getSubtitle(for imdex: IndexPath) -> String
    func getImageForCell() -> String
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

    func getTitle(for index: IndexPath) -> String {
        return notes[index.section].group[index.row].title
    }

    func getSubtitle(for index: IndexPath) -> String {
        return notes[index.section].group[index.row].subtitle
    }

    func getImageForCell() -> String {
        return "folder"
    }
    
    func showDetail(data: Note?) {
        router?.showDetail(note: data)
    }
}
