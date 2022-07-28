import UIKit

protocol StepPageDisplayProtocol: AnyObject {
    func display(step: UIViewController, direction: UIPageViewController.NavigationDirection)
}

final class StepPageViewController: UIPageViewController {
    private let presenter: StepPagePresenterProtocol
    
    init(presenter: StepPagePresenterProtocol,
         transitionStyle style: UIPageViewController.TransitionStyle = .pageCurl,
         navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
         options: [UIPageViewController.OptionsKey : Any]? = nil
    ) {
        self.presenter = presenter
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.presentFirstStep()
    }
}

extension StepPageViewController: StepPageDisplayProtocol {
    func display(step: UIViewController, direction: UIPageViewController.NavigationDirection) {
        setViewControllers([step], direction: direction, animated: true)
        didMove(toParent: step)
    }
}
