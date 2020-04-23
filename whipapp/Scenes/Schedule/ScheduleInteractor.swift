import UIKit

protocol ScheduleBusinessLogic {
    func getRandomMeals(request: Schedule.Request)
}

protocol ScheduleDataStore {
}

class ScheduleInteractor: ScheduleBusinessLogic, ScheduleDataStore {
    var presenter: SchedulePresentationLogic?
    var worker = ScheduleWorker()
    
    func getRandomMeals(request: Schedule.Request) {
        worker.getRandomMeals(request: request) { (data) -> (Void) in
            let response = Schedule.Response(data: data)
            self.presenter?.presentRandomMeals(response: response)
        }
    }
}
