//
//  ViewController.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import UIKit
import SnapKit

class MainGroupsViewController: UIViewController {
    
    // MARK: - Private properties
    
    var presenter: GroupsPresenterProtocol?
    
    // MARK: - Outlets
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Search"
        search.searchBar.delegate = self
        return search
    }()
    
    private lazy var groupsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(GroupsHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        return table
    }()

    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()

    private lazy var leftButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "folder.badge.plus")
        button.setImage(image, for: .normal)
        button.tintColor = .systemYellow
        button.imageView?.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.3)
        return button
    }()

    private lazy var rightButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "square.and.pencil")
        button.setImage(image, for: .normal)
        button.tintColor = .systemYellow
        button.imageView?.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.3)
        return button
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
        title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(buttonTapped))
        navigationController?.navigationBar.tintColor = .systemYellow
        navigationItem.searchController = searchController
    }
    
    private func setupHierarchy() {
        view.addSubview(groupsTable)
        view.addSubview(bottomView)
        bottomView.addSubview(leftButton)
        bottomView.addSubview(rightButton)
    }
    
    private func setupLayout() {
        groupsTable.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }

        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view.snp.bottom).multipliedBy(0.9)
        }

        leftButton.snp.makeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(20)
            make.left.equalTo(bottomView.snp.left).offset(20)
            make.width.height.equalTo(40)
        }

        rightButton.snp.makeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(20)
            make.right.equalTo(bottomView.snp.right).offset(-20)
            make.width.height.equalTo(40)
        }
    }
    
    @objc func buttonTapped() {
        // Any action
    }
}

// MARK: - Extensions

extension MainGroupsViewController: MainViewProtocol {
    func reloadTable() {
        groupsTable.reloadData()
    }
}

extension MainGroupsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.showSearchResults(for: searchText)
    }
}

extension MainGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.presenter?.getNumberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.getNumberOfRow(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter?.getTitle(for: indexPath)
        cell.detailTextLabel?.text = presenter?.getCountNotes(for: indexPath)
        cell.imageView?.image = UIImage(systemName: "folder")
        cell.tintColor = .systemYellow
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! GroupsHeaderView
        let groupTitle = presenter?.getGroupTitle(for: section)

        switch section {
        case 0, 1, 2 :
            view.label.text = groupTitle
        default:
            view.label.text = ""
        }

        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        presenter?.showDetail(for: indexPath)
    }
}

