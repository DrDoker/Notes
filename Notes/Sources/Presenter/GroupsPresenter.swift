//
//  Presenter.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import Foundation

protocol GroupsPresenterProtocol: AnyObject {
    func getNumberOfSections() -> Int
    func getNumberOfRow(for section: Int) -> Int
    func getTitle(for index: IndexPath) -> String
    func getCountNotes(for index: IndexPath) -> String
    func getGroupTitle(for section: Int) -> String
    func showDetail(for index: IndexPath)
}

class GroupsPresenter: GroupsPresenterProtocol {
    weak var view: MainGroupsViewController?
    var router: RouterProtocol?
    private let goups: [NotesGroup]
    
    required init(view: MainGroupsViewController, goups: [NotesGroup], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.goups = goups
    }
    
    func getNumberOfSections() -> Int {
        goups.count
    }
    
    func getNumberOfRow(for section: Int) -> Int {
        goups[section].group.count
    }

    func getTitle(for index: IndexPath) -> String {
        return goups[index.section].group[index.row].title
    }

    func getCountNotes(for index: IndexPath) -> String {
        let stringCounts = String(goups[index.section].group[index.row].countNotes)
        return stringCounts
    }

    func getGroupTitle(for section: Int) -> String {
        return goups[section].title
    }

    func showDetail(for index: IndexPath) {
        let folder = goups[index.section].group[index.row]
        router?.showFolder(folder: folder)
    }
}
