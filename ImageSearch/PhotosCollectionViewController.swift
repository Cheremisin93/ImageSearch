//
//  PhotosCollectionViewController.swift
//  ImageSearch
//
//  Created by Cheremisin Andrey on 18.06.2022.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }()
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionButtonTapped))
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .lightGray
        setupCollectionView()
        setupNavigationBar()
        setupSearchBar()
    }
    
    //MARK: - Setup UI Element
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Photos"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtonItem]
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        
    }
    // MARK: - NavigationItems action
    
    @objc private func addButtonTapped() {
        print(#function)
    }
    
    @objc private func actionButtonTapped() {
        print(#function)
    }
    
    
    // MARK: - UICollectionViewDatasource/Delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
}

// MARK: - UISearchBarDelegate

extension PhotosCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
