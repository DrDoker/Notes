//
//  Presenter.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var goups: [NotesGroup] { get }
    
    init(view: MenuViewController, notes: [NotesGroup], router: RouterProtocol)
    func getNumberOfSections() -> Int
    func getNumberOfRow(section: Int) -> Int
    func showDetail(data: NotesFolder?)
}

class Presenter: MainPresenterProtocol {
    weak var view: MenuViewController?
    var router: RouterProtocol?
    let goups: [NotesGroup]
    
    required init(view: MenuViewController, notes: [NotesGroup], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.goups = notes
    }
    
    func getNumberOfSections() -> Int {
        goups.count
    }
    
    func getNumberOfRow(section: Int) -> Int {
        goups[section].group.count
    }
    
    func showDetail(data: NotesFolder?) {
        router?.showDetail(folder: data)
    }
}
