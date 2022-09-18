//
//  Presenter.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import Foundation

protocol GroupsPresenterProtocol: AnyObject {
    func getNumberOfSections() -> Int
    func getNumberOfRow(section: Int) -> Int
    func getTitle(for index: IndexPath) -> String
    func getCountNotes(for index: IndexPath) -> String
    func getGroupTitle(section: Int) -> String
    func showDetail(index: IndexPath)
}

class GroupsPresenter: GroupsPresenterProtocol {
    weak var view: MainGroupsViewController?
    var router: RouterProtocol?
    let goups: [NotesGroup]
    
    required init(view: MainGroupsViewController, goups: [NotesGroup], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.goups = goups
    }
    
    func getNumberOfSections() -> Int {
        goups.count
    }
    
    func getNumberOfRow(section: Int) -> Int {
        goups[section].group.count
    }

    func getTitle(for index: IndexPath) -> String {
        return goups[index.section].group[index.row].title
    }

    func getCountNotes(for index: IndexPath) -> String {
        let stringCounts = String(goups[index.section].group[index.row].countNotes)
        return stringCounts
    }

    func getGroupTitle(section: Int) -> String {
        return goups[section].title
    }

    func showDetail(index: IndexPath) {
        let folder = goups[index.section].group[index.row]
        router?.showDetail(folder: folder)
    }
}
