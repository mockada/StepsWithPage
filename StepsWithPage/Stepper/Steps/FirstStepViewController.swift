import UIKit

enum FirstStepFactory {
    static func make(buttonDelegate: FirstStepButtonDelegate) -> UIViewController {
        let viewController = FirstStepViewController()
        viewController.buttonDelegate = buttonDelegate
        return viewController
    }
}

protocol FirstStepButtonDelegate: AnyObject {
    func showPreviousAnyStep()
    func showForwardSecondStep()
}

final class FirstStepViewController: UIViewController {
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First textField"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("Previous", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(previousButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var buttonDelegate: FirstStepButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -16),
            
            previousButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            previousButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: 16),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
}

@objc
private extension FirstStepViewController {
    func previousButtonDidTap() {
        buttonDelegate?.showPreviousAnyStep()
    }
    
    func nextButtonDidTap() {
        buttonDelegate?.showForwardSecondStep()
    }
}
