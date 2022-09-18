//
//  DetailViewController.swift
//  mvp_testApp
//
//  Created by Serhii  on 17/09/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Private properties
    
    var presenter: DetailPresenterProtocol?
    
    // MARK: - Outlets
    
    private lazy var detailTitleText: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lable.text = presenter?.note?.title
        return lable
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Menu", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        return button
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
        view.addSubview(detailTitleText)
        view.addSubview(menuButton)
    }
    
    private func setupLayout() {
        
        detailTitleText.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-100)
        }
        
        menuButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(100)
        }
    }
}

extension DetailViewController {
    @objc func showMenu() {
        presenter?.showMenu()
    }
}

