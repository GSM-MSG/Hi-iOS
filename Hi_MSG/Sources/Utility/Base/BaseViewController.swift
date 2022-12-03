import UIKit

class BaseViewController: UIViewController {
    let bounds = UIScreen().bounds
    
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
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
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
