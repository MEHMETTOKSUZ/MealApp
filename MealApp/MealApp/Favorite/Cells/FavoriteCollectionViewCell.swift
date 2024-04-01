//
//  FavoriteCollectionViewCell.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 30.03.2024.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func itemFromCell(item: SearchTableViewCell.ViewModel) {
        
        let image = item.strMealThumb
        self.mealImageView.downloaded(from: image, contentMode: .scaleToFill)
        self.mealImageView.layer.cornerRadius = 25

    }
}
