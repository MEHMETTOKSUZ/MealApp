//
//  DetailsViewController.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 21.03.2024.
//

import UIKit
import YouTubeiOSPlayerHelper

class DetailsViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var strIngredient1: UILabel!
    @IBOutlet weak var strIngredient2: UILabel!
    @IBOutlet weak var strIngredient3: UILabel!
    @IBOutlet weak var strIngredient4: UILabel!
    @IBOutlet weak var strIngredient5: UILabel!
    @IBOutlet weak var strMealThumb: UIImageView!
    @IBOutlet weak var strInstructions: UILabel!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet var playerView: YTPlayerView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var viewModel: DetailsViewModel!
    let favorites = FavoriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favorites.loadFavorites()
        updateFavoriteButtonAppearance()
        setupUI()
        navigationItem.rightBarButtonItem = favoriteButton
        
    }
    
    func setupUI() {
        
        playerView.alpha = 0
        self.itemFromUI(item: self.viewModel.UIModel)
        guard let id = viewModel.UIModel.videoID else {
            return
        }
        
        DispatchQueue.main.async {
            self.playerView.load(withVideoId: id)
        }
        playerView.delegate = self
    }
    
    func itemFromUI(item: DetailsUIModel) {
        
        self.strIngredient1.text = "\(item.strIngredient1) \(item.strMeasure1)"
        self.strIngredient2.text = "\(item.strIngredient2) \(item.strMeasure2)"
        self.strIngredient3.text = "\(item.strIngredient3) \(item.strMeasure3)"
        
        if let ingredient = item.strIngredient4, let measure = item.strMeasure4 {
            self.strIngredient4.text = "\(ingredient) \(measure)"
        }
        
        if let ingredient = item.strIngredient5, let measure = item.strMeasure5 {
            self.strIngredient5.text = "\(ingredient) \(measure)"
        }
        
        let image = item.strMealThumb
        strMealThumb.downloaded(from: image, contentMode: .scaleToFill)
        strInstructions.text = item.strInstructions
        
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.alpha = 1
        activityView.isHidden = true
        
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        
        let data = viewModel.UIModel.data.data
        FavoriteManager.shared.add(item: data)
        updateFavoriteButtonAppearance()
        
    }
    
    func updateFavoriteButtonAppearance() {
        let isFavorite = FavoriteManager.shared.isFavorite(item: viewModel.UIModel.data.data)
        let imageName = isFavorite ? "star.fill" : "star"
        favoriteButton.image = UIImage(systemName: imageName)
    }
}



