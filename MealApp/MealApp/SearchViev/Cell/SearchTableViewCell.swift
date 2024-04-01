//
//  SearchTableViewCell.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 19.03.2024.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    struct ViewModel {
        
        let idMeal: String
        let strMeal: String
        let strDrinkAlternate: String?
        let strCategory: String
        let strArea: String
        let strInstructions: String
        let strMealThumb: String?
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
        let data: Meal
    }
    
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealTags: UILabel!
    @IBOutlet weak var mealCountry: UILabel!
    @IBOutlet weak var mealCategory: UILabel!
    
    func itemFromCell(item: ViewModel) {
        
        self.mealTags.text = item.strTags
        self.mealCountry.text = item.strArea
        self.mealCategory.text = item.strCategory
        self.mealName.text = item.strMeal
        let image = item.strMealThumb
        self.mealImage.downloaded(from: image, contentMode: .scaleAspectFill)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SearchTableViewCell.ViewModel {
    init(response: Meal) {
        
        self.init(idMeal: response.idMeal,
                  strMeal: response.strMeal,
                  strDrinkAlternate: response.strDrinkAlternate,
                  strCategory: response.strCategory,
                  strArea: response.strArea,
                  strInstructions: response.strInstructions,
                  strMealThumb: response.strMealThumb,
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
