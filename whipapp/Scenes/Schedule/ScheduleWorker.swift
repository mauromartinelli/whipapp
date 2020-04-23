import UIKit
import Alamofire

class ScheduleWorker {
  
    func getRandomMeals(request: Schedule.Request, onCompletion: @escaping ServiceResponse) {
        let parameters: [String: Any] = ["limitLicense":true,
                                         "tags":"main course",
                                         "number":request.amount]
        RestApiManager.shared.makeHTTPRequest(path: "recipes/random", httpMethod: .get, body: parameters) { (json) -> (Void) in
            onCompletion(json)
        }
    }
    
}
