import UIKit
import KRProgressHUD

protocol ScheduleDisplayLogic: class {
    func displayRandomMeals(viewModel: Schedule.ViewModel)
}

class ScheduleViewController: UIViewController, ScheduleDisplayLogic, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var scheduleTableView: UITableView!
    var interactor: ScheduleBusinessLogic?
    var router: (NSObjectProtocol & ScheduleRoutingLogic & ScheduleDataPassing)?
    var meals = [Meal]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = ScheduleInteractor()
        let presenter = SchedulePresenter()
        let router = ScheduleRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Plan your week"
    }
    
    func displayRandomMeals(viewModel: Schedule.ViewModel) {
        KRProgressHUD.dismiss()
        self.meals = viewModel.meals
        self.scheduleTableView.reloadData()
    }
    
    func weekdayNameFrom(_ weekdayNumber: Int) -> String {
        let calendar = Calendar.current
        let weekdaySymbols = calendar.weekdaySymbols
        let index = (weekdayNumber + calendar.firstWeekday) % 7
        
        return weekdaySymbols[index]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.getRandomMeals(amount: 7)
        }
    }
    
    private func getRandomMeals(amount: Int) {
        KRProgressHUD.show()
        let request = Schedule.Request(amount: amount)
        interactor?.getRandomMeals(request: request)
    }
}
