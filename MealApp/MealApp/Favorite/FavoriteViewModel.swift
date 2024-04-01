//
//  FavoriteViewModel.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 30.03.2024.
//

import Foundation

class FavoriteViewModel {
    
    var didFinishLoad: (() -> Void)?
    var didFinishLoadWithError: ((String) -> Void)?
    var favorite: [SearchTableViewCell.ViewModel] = []
    let favoriteManager = FavoriteManager.shared
    
    var numberOfItemsInSections: Int {
        
        return favorite.count
    }
    
    func item(at index: Int) -> SearchTableViewCell.ViewModel? {
        
        guard index >= 0, index < favorite.count else {
                    return nil
                }
                return favorite[index]
    }
    
    func loadFavorites() {
        
        let items = favoriteManager.get()
        self.presentResults(result: items)
        self.didFinishLoad?()
    }
    
    func presentResults(result: [Meal]) {
        let viewModel: [SearchTableViewCell.ViewModel] = result.map { results in
            SearchTableViewCell.ViewModel(response: results)
        }
        
        self.favorite = viewModel
        self.didFinishLoad?()
        
    }
}
