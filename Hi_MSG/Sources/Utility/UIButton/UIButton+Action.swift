import UIKit

extension UIButton {
    typealias ButtonTargetClosure = (UIButton) -> Void
    
    private class ButtonClosureWrapper: NSObject {
        let closure: ButtonTargetClosure
        init(_ closure: @escaping ButtonTargetClosure) {
            self.closure = closure
        }
    }
    
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    private var targetClosure: ButtonTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ButtonClosureWrapper else { return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.targetClosure,
                                     ButtonClosureWrapper(newValue),
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func actionClosure() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
    
    func addTarget(for event: UIButton.Event, closure: @escaping ButtonTargetClosure) {
        targetClosure = closure
        addTarget(self, action: #selector(UIButton.actionClosure), for: event)
    }
}
