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
    func showSearchResults(for text: String)
}

class GroupsPresenter: GroupsPresenterProtocol {
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    private let groups: [NotesGroup]
    private var filteredGroups: [NotesGroup]
    
    required init(view: MainViewProtocol, groups: [NotesGroup], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.groups = groups
        self.filteredGroups = groups
    }
    
    func getNumberOfSections() -> Int {
        filteredGroups.count
    }
    
    func getNumberOfRow(for section: Int) -> Int {
        filteredGroups[section].group.count
    }

    func getTitle(for index: IndexPath) -> String {
        return filteredGroups[index.section].group[index.row].title
    }

    func getCountNotes(for index: IndexPath) -> String {
        let stringCounts = String(filteredGroups[index.section].group[index.row].countNotes)
        return stringCounts
    }

    func getGroupTitle(for section: Int) -> String {
        return filteredGroups[section].title
    }

    func showDetail(for index: IndexPath) {
        let folder = filteredGroups[index.section].group[index.row]
        router?.showFolder(folder: folder)
    }

    func showSearchResults(for text: String) {
        filteredGroups = [NotesGroup]()
        if text == "" {
            filteredGroups = groups
        } else {
            for item in groups {
                if item.title.lowercased().contains(text.lowercased()) {
                    filteredGroups.append(item)
                }
            }
        }
        self.view?.reloadTable()
    }
}



