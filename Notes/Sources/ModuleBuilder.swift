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
        let model = NotesGroup.goups
        let view = MenuViewController()
        let presenter = Presenter(view: view, notes: model, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(folder: NotesFolder?, router: RouterProtocol) -> UIViewController {
        let model = folder
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, folder: model, router: router)
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
