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
    func createDetailModule(note: Note?, router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let model = Note.notes
        let view = MenuViewController()
        let presenter = Presenter(view: view, notes: model, router: router)
        view.presenter = presenter
        return view
    }

    func createDetailModule(note: Note?, router: RouterProtocol) -> UIViewController {
        let model = note
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, note: model, router: router)
        view.presenter = presenter
        return view
    }

}
