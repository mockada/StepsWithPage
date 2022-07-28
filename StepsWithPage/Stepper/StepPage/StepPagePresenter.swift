import UIKit

protocol StepPagePresenterProtocol {
    func presentFirstStep()
}

final class StepPagePresenter {
    weak var viewController: StepPageDisplayProtocol?
    
    // Para construção da barra de progresso
    private var stepViewControllerList = [UIViewController]()
}

private extension StepPagePresenter {
    func append(viewController: UIViewController) {
        stepViewControllerList.append(viewController)
    }
    
    func removeLast() {
        stepViewControllerList.removeLast()
    }
}

extension StepPagePresenter: StepPagePresenterProtocol {
    func presentFirstStep() {
        let nextViewController = FirstStepFactory.make(buttonDelegate: self)
        append(viewController: nextViewController)
        viewController?.display(step: nextViewController, direction: .forward)
    }
}

extension StepPagePresenter: FirstStepButtonDelegate {
    func showPreviousAnyStep() {
        
    }
    
    func showForwardSecondStep() {
        let nextViewController = SecondStepFactory.make(buttonDelegate: self)
        append(viewController: nextViewController)
        viewController?.display(step: nextViewController, direction: .forward)
    }
}

extension StepPagePresenter: SecondStepButtonDelegate {
    func showPreviousFirstStep() {
        removeLast()
        guard let previousViewController = stepViewControllerList.last else { return }
        viewController?.display(step: previousViewController, direction: .reverse)
    }
    
    func showForwardAnyStep() {
        
    }
}
