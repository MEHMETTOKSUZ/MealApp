//
//  FavoriteManager.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 30.03.2024.
//

import Foundation

class FavoriteManager {
    
    static let shared = FavoriteManager()
    private init() {}
    
    let userDefaults = UserDefaults.standard
    let key = "favoriteMeal"
    var favorites: [Meal] = []
    
    func load() {
        
        if let data = userDefaults.object(forKey: key) as? Data,
           let favorites = try? JSONDecoder().decode([Meal].self, from: data) {
            self.favorites = favorites
        }
    }
    
    func get() -> [Meal] {
        self.load()
        return favorites
    }
    
    func add(item: Meal) {
        
        if let index = favorites.firstIndex(where: {$0.idMeal == item.idMeal}) {
            favorites.remove(at: index)
        } else {
            favorites.insert(item, at: 0)
        }
        saved()
        sendNotification()
    }
    
    func isFavorite(item: Meal) -> Bool {
        return favorites.contains {$0.idMeal == item.idMeal}
    }
    
    func saved() {
        if let data = try? JSONEncoder().encode(favorites) {
            userDefaults.set(data, forKey: key)
        }
    }
    
    func sendNotification() {
        NotificationCenter.default.post(name: NSNotification.Name("addedFavorite"), object: nil)
        
    }
}
