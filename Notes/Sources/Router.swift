//
//  RouterProtocol.swift
//  mvp_testApp
//
//  Created by Serhii  on 17/09/2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: BuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(folder: NotesFolder?)
    func showNote(note: Note?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: BuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(folder: NotesFolder?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(folder: folder, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func showNote(note: Note?) {
        if let navigationController = navigationController {
            guard let noteViewController = assemblyBuilder?.createNoteModule(note: note, router: self) else { return }
            navigationController.pushViewController(noteViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
