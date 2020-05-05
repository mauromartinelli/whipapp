@testable import whipapp
import XCTest

class ScheduleViewControllerTests: XCTestCase {
    var sut: ScheduleViewController!

    override func setUp() {
        super.setUp()
        self.setupScheduleViewController()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    private func setupScheduleViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(identifier: "ScheduleViewController") as? ScheduleViewController
    }
    
    private func loadView() {
        sut.loadView()
    }

    func testViewDidLoadShouldRequestRandomMeals() {
        // Given
        let spy = ScheduleBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.viewDidLoad()
        
        // Then
        XCTAssert(spy.getRandomMealsWasCalled, "shake should request meals")
    }
}

class ScheduleBusinessLogicSpy: ScheduleBusinessLogic {
    var getRandomMealsWasCalled = false
    
    func getRandomMeals(request: Schedule.Request) {
        getRandomMealsWasCalled = true
    }
}
