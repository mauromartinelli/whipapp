import Foundation

struct Ingredient: Codable {
    var name: String
    var amount: Double
    
    private enum CodingKeys: String, CodingKey {
        case name
        case amount
    }
}

struct Meal: Codable {
    var title: String
    var minutes: Int
    var ingredients: [Ingredient]
    var imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case minutes = "readyInMinutes"
        case ingredients = "extendedIngredients"
        case imageUrl = "image"
    }
}

struct Recipes: Codable {
    var meals: [Meal]
    
    private enum CodingKeys: String, CodingKey {
        case meals = "recipes"
    }
}
