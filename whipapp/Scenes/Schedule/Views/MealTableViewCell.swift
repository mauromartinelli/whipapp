import UIKit

class MealTableViewCell: UITableViewCell {
    static let identifier = "MealCell"
    @IBOutlet weak var dayLabel: PaddingLabel!
    @IBOutlet weak var poster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDayLabel()
    }
    
    private func setupDayLabel() {
        dayLabel.clipsToBounds = true
        dayLabel.layer.cornerRadius = 10
        dayLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        dayLabel.padding(5, 5, 15, 15)
    }

    func setup(with meal: Meal, day: String) {
        dayLabel.text = day
        let placeholder = UIImage(named: "meal_placeholder")
        poster.setImage(urlString: meal.imageUrl, placeholder: placeholder)
    }
}


