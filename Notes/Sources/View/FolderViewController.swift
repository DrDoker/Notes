//
//  DetailViewController.swift
//  mvp_testApp
//
//  Created by Serhii  on 17/09/2022.
//

import UIKit
import SnapKit

class FolderViewController: UIViewController {

    // MARK: - Private properties

    var presenter: FolderPresenterProtocol?

    // MARK: - Outlets

    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Search"
        search.searchBar.delegate = self
        return search
    }()

    private lazy var notesTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        return table
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupHierarchy()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTable()
    }

    // MARK: - Setups

    private func setupNavBar() {
        title = presenter?.getFolderTitle()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(buttonTapped))
        navigationController?.navigationBar.tintColor = .systemYellow
        navigationItem.searchController = searchController
    }

    private func setupHierarchy() {
        view.addSubview(notesTable)
    }

    private func setupLayout() {
        notesTable.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }

    @objc func buttonTapped() {
        print("Нажата кнопка редактирования")
    }

}

// MARK: - Extensions

extension FolderViewController: FolderViewProtocol {
    func reloadTable() {
        notesTable.reloadData()
    }
}

extension FolderViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.showSearchResults(for: searchText)
    }
}

extension FolderViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.getNumberOfRow() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter?.getTitle(for: indexPath)
        cell.detailTextLabel?.text = presenter?.getText(for: indexPath)
        cell.imageView?.image = UIImage(systemName: "note.text")
        cell.tintColor = .systemYellow
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        presenter?.showNote(for: indexPath)
    }
}



