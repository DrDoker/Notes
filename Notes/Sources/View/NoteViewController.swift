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
        lable.numberOfLines = 0
        return lable
    }()

    private lazy var noteText: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lable.numberOfLines = 0
        lable.textAlignment = .natural
        return lable
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        setupNote()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(noteTitle)
        view.addSubview(noteText)
    }

    private func setupLayout() {

        noteTitle.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.centerY).multipliedBy(0.25)
            make.left.equalTo(view.snp.left).offset(20)
        }

        noteText.snp.makeConstraints { make in
            make.top.equalTo(noteTitle.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(20)
        }
    }
}

// MARK: - Extensions

extension NoteViewController: NoteViewProtocol {
    // Any function
}

extension NoteViewController {
    func setupNote() {
        noteTitle.text = presenter?.getTitle()
        noteText.text = presenter?.getText()
    }
}
