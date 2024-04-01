//
//  ViewModel.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 18.03.2024.
//

import Foundation

class SearchViewModel {
    
    var didFinishLoad: (() -> Void)?
    var didFinishLoadWithError: ((String) -> Void)?
    var meal: [SearchTableViewCell.ViewModel] = []
    
    var numberOfItemInSection: Int {
        return meal.count
    }
    
    func item(at index: Int) -> SearchTableViewCell.ViewModel? {
        guard index >= 0, index < meal.count else {
            return nil
        }
        return meal[index]
    }
    
    func get(mealName: String) {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(mealName)") else {
            print("Geçersiz URL")
            return
        }
        
        WebService.shared.fetchData(from: url) { (result: Result<MealsResponse, Error>) in
            switch result {
            case .success(let data):
                self.present(result: data.meals)
            case .failure(let error):
                self.didFinishLoadWithError?(error.localizedDescription)
            }
        }
    }
    
    func present(result: [Meal]) {
        let viewModel: [SearchTableViewCell.ViewModel] = result.map { results in
            SearchTableViewCell.ViewModel(response: results)
        }
        
        self.meal = viewModel
        self.didFinishLoad?()
        
    }
    
    func clearResults() {
        meal.removeAll()
    }
}
