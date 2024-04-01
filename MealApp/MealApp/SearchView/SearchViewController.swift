//
//  ViewController.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 18.03.2024.
//

import UIKit

class SearchViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = SearchViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibname = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nibname, forCellReuseIdentifier: "SearchTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Meal"
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.tintColor = UIColor.orange
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        guard let data = viewModel.item(at: indexPath.row) else {
            return cell
            
        }
        cell.itemFromCell(item: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedData = viewModel.item(at: indexPath.row)
        performSegue(withIdentifier: "toDetailsFromHome", sender: selectedData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsFromHome" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let data = viewModel.item(at: indexPath.row) {
                    let viewModel = DetailsViewModel(selected: data)
                    let destination = segue.destination as! DetailsViewController
                    destination.viewModel = viewModel
                    
                }
            }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text {
            viewModel.get(mealName: query)
        }
        
        if searchController.searchBar.text?.isEmpty ?? true {
            viewModel.clearResults()
        }
       tableView.reloadData()
    }
}


