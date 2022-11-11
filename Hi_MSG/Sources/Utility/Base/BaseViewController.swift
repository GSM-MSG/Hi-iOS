import UIKit

class BaseViewController: UIViewController {
    // MARK: - Properties
    let bounds = UIScreen().bounds
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundIfNotSet()
        setup()
        addView()
        setLayout()
        
        bind()
    }
    
    override func viewDidLayoutSubviews() {
        setLayoutSubviews()
    }
    
    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Method
    private func setupBackgroundIfNotSet() {
        if self.view.backgroundColor == nil {
            self.view.backgroundColor = .white
        }
    }
    
    func setup() {}
    func addView() {}
    func setLayout() {}
    func setLayoutSubviews() {}
    
    func bind() {}
}
