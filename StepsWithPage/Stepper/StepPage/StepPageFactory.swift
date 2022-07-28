import UIKit

enum StepPageFactory {
    static func make() -> UIViewController {
        let presenter = StepPagePresenter()
        let viewController = StepPageViewController(presenter: presenter)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
