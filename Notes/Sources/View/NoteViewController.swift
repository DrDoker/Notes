//
//  NoteViewController.swift
//  Notes
//
//  Created by Serhii  on 18/09/2022.
//

import Foundation

import UIKit

class NoteViewController: UIViewController {

    // MARK: - Private properties

    var presenter: NotePresenterProtocol?

    // MARK: - Outlets
    private lazy var noteTitle: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lable.text = presenter?.note?.title
        return lable
    }()

    private lazy var noteSubtitle: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        lable.text = presenter?.note?.subtitle
        return lable
    }()

    private lazy var noteText: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lable.text = presenter?.note?.text
        return lable
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(noteTitle)
        view.addSubview(noteSubtitle)
        view.addSubview(noteText)
    }

    private func setupLayout() {

        noteTitle.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-150)
        }

        noteSubtitle.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-100)
        }

        noteText.snp.makeConstraints { make in
            make.center.equalTo(view)
        }

    }
}


