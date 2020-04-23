import UIKit

@objc protocol ScheduleRoutingLogic {
    //func routeToSomewhere()
}

protocol ScheduleDataPassing {
    var dataStore: ScheduleDataStore? { get }
}

class ScheduleRouter: NSObject, ScheduleRoutingLogic, ScheduleDataPassing {
    weak var viewController: ScheduleViewController?
    var dataStore: ScheduleDataStore?
    
    //func routeToSomewhere()
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //}
    
    //func navigateToSomewhere(source: ScheduleViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    //func passDataToSomewhere(source: ScheduleDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
