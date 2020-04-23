import Foundation
import Alamofire

typealias ServiceResponse = (Data?) -> (Void)

class RestApiManager: NSObject {
    static let shared = RestApiManager()
    
    func makeHTTPRequest(baseURL: String = "https://api.spoonacular.com/", path: String, httpMethod: HTTPMethod, body: Parameters = [:], headers: HTTPHeaders = [:], onCompletion: @escaping ServiceResponse) {
        let serialization: ParameterEncoding = Alamofire.URLEncoding.default
        let completeUrl = baseURL + path
        var body = body
        body["apiKey"] = "f579a7a5a988486d8da716769ab67fae"
        
        AF.request(completeUrl, method: httpMethod, parameters: body, encoding: serialization, headers: headers).response { (response) -> Void in
            onCompletion(response.data)
        }
    }
}
