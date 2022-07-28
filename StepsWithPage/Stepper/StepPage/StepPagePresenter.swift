import UIKit

protocol StepPagePresenterProtocol {
    func presentFirstStep()
}

final class StepPagePresenter {
    weak var viewController: StepPageDisplayProtocol?
    
    private let progressBarPresenter: ProgressBarPresenterProtocol
    
    init(progressBarPresenter: ProgressBarPresenterProtocol = ProgressBarPresenter()) {
        self.progressBarPresenter = progressBarPresenter
    }
}

extension StepPagePresenter: StepPagePresenterProtocol {
    func presentFirstStep() {
        let nextViewController = FirstStepFactory.make(buttonDelegate: self)
        progressBarPresenter.append(viewController: nextViewController)
        viewController?.display(step: nextViewController, direction: .forward)
    }
}

extension StepPagePresenter: FirstStepButtonDelegate {
    func showPreviousAnyStep() {
        
    }
    
    func showForwardSecondStep() {
        let nextViewController = SecondStepFactory.make(buttonDelegate: self)
        progressBarPresenter.append(viewController: nextViewController)
        viewController?.display(step: nextViewController, direction: .forward)
    }
}

extension StepPagePresenter: SecondStepButtonDelegate {
    func showPreviousFirstStep() {
        progressBarPresenter.removeLast()
        guard let previousViewController = progressBarPresenter.currentViewController else { return }
        viewController?.display(step: previousViewController, direction: .reverse)
    }
    
    func showForwardAnyStep() {
        
    }
}
