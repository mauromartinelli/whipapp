import Foundation
import UIKit

extension ScheduleViewController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier) as! MealTableViewCell
        let meal = self.meals[indexPath.section]
        let day = weekdayNameFrom(indexPath.section)
        cell.setup(with: meal, day: day)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.meals.count
    }
    
}
