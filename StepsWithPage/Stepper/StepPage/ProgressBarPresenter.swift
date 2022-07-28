import UIKit

protocol ProgressBarPresenterProtocol {
    func append(viewController: UIViewController)
    func removeLast()
    var currentViewController: UIViewController? { get }
}

final class ProgressBarPresenter {
    private var viewControllerList = [UIViewController]()
    var currentViewController: UIViewController?
}

extension ProgressBarPresenter: ProgressBarPresenterProtocol {
    func append(viewController: UIViewController) {
        viewControllerList.append(viewController)
        currentViewController = viewController
    }
    
    func removeLast() {
        viewControllerList.removeLast()
        currentViewController = viewControllerList.last
    }
}
