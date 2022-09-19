//
//  Presenter.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func reloadTable()
}

protocol GroupsPresenterProtocol: AnyObject {
    func getNumberOfSections() -> Int
    func getNumberOfRow(for section: Int) -> Int
    func getTitle(for index: IndexPath) -> String
    func getCountNotes(for index: IndexPath) -> String
    func getGroupTitle(for section: Int) -> String
    func showDetail(for index: IndexPath)
}

class GroupsPresenter: GroupsPresenterProtocol {
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    private let groups: [NotesGroup]
    
    required init(view: MainViewProtocol, groups: [NotesGroup], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.groups = groups
    }
    
    func getNumberOfSections() -> Int {
        groups.count
    }
    
    func getNumberOfRow(for section: Int) -> Int {
        groups[section].group.count
    }

    func getTitle(for index: IndexPath) -> String {
        return groups[index.section].group[index.row].title
    }

    func getCountNotes(for index: IndexPath) -> String {
        let stringCounts = String(groups[index.section].group[index.row].countNotes)
        return stringCounts
    }

    func getGroupTitle(for section: Int) -> String {
        return groups[section].title
    }

    func showDetail(for index: IndexPath) {
        let folder = groups[index.section].group[index.row]
        router?.showFolder(folder: folder)
    }
}
