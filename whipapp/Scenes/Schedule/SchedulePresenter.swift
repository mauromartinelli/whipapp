import UIKit

protocol SchedulePresentationLogic {
    func presentRandomMeals(response: Schedule.Response)
}

class SchedulePresenter: SchedulePresentationLogic {
    weak var viewController: ScheduleDisplayLogic?
    
    func presentRandomMeals(response: Schedule.Response) {
        guard let data = response.data else {
            self.displayMeals([])
            
            return
        }
        do {
            let decoder = JSONDecoder()
            let recipe = try decoder.decode(Recipes.self, from: data)
            self.displayMeals(recipe.meals)
        }
        catch _ {
            self.displayMeals([])
        }
    }
    
    private func displayMeals(_ meals: [Meal]) {
        let viewModel = Schedule.ViewModel(meals: meals)
        viewController?.displayRandomMeals(viewModel: viewModel)
    }
}
