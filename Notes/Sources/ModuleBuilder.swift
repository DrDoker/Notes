//
//  ModuleBuilder.swift
//  mvp_testApp
//
//  Created by Serhii  on 16/09/2022.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(folder: NotesFolder?, router: RouterProtocol) -> UIViewController
    func createNoteModule(note: Note?, router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let model = NotesGroup.groups
        let view = MainGroupsViewController()
        let presenter = GroupsPresenter(view: view, goups: model, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(folder: NotesFolder?, router: RouterProtocol) -> UIViewController {
        let model = folder
        let view = FolderViewController()
        let presenter = FolderPresenter(view: view, folder: model, router: router)
        view.presenter = presenter
        return view
    }

    func createNoteModule(note: Note?, router: RouterProtocol) -> UIViewController {
        let model = note
        let view = NoteViewController()
        let presenter = NotePresenter(view: view, note: model, router: router)
        view.presenter = presenter
        return view
    }
    
}
