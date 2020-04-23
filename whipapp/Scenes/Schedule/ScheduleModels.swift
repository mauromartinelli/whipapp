import UIKit

enum Schedule {
        
    struct Request {
        var amount: Int
    }
    
    struct Response {
        var data: Data?
    }
    
    struct ViewModel {
        var meals: [Meal]
    }
}
