//
//  DetailsViewModel.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 21.03.2024.
//

import Foundation

struct DetailsUIModel {
    
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let data: SearchTableViewCell.ViewModel
    
    var videoID: String? {
        guard let urlString = strYoutube.components(separatedBy: "?").last else {
            return nil
        }
        
        let pairs = urlString.components(separatedBy: "&")
        for pair in pairs {
            let keyValue = pair.components(separatedBy: "=")
            if keyValue.first == "v" {
                return keyValue.last
            }
        }
        
        return nil
    }
}

class DetailsViewModel {
    
    let UIModel: DetailsUIModel
    
    init(selected: SearchTableViewCell.ViewModel) {
        self.UIModel = DetailsUIModel(response: selected)
    }
}


extension DetailsUIModel {
    init(response: SearchTableViewCell.ViewModel) {
       
        self.init(idMeal: response.idMeal,
                  strMeal: response.strMeal,
                  strDrinkAlternate: response.strDrinkAlternate,
                  strCategory: response.strCategory,
                  strArea: response.strArea,
                  strInstructions: response.strInstructions,
                  strMealThumb: response.strMealThumb ?? "",
                  strTags: response.strTags,
                  strYoutube: response.strYoutube,
                  strIngredient1: response.strIngredient1,
                  strIngredient2: response.strIngredient2,
                  strIngredient3: response.strIngredient3,
                  strIngredient4: response.strIngredient4,
                  strIngredient5: response.strIngredient5,
                  strIngredient6: response.strIngredient6,
                  strIngredient7: response.strIngredient7,
                  strIngredient8: response.strIngredient8,
                  strMeasure1: response.strMeasure1,
                  strMeasure2: response.strMeasure2,
                  strMeasure3: response.strMeasure3,
                  strMeasure4: response.strMeasure4,
                  strMeasure5: response.strMeasure5,
                  strMeasure6: response.strMeasure6,
                  strMeasure7: response.strMeasure7,
                  strMeasure8: response.strMeasure8,
                  data: response
        )
       
    }
}


