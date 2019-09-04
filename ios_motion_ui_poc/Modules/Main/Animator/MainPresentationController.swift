import UIKit

class MainPresentationController: UIPresentationController {
    
    var backgroundView: UIView?
    
    private let presentationSize = UIScreen.main.bounds.size
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let origin: CGPoint = CGPoint(x: (containerView!.bounds.width - presentationSize.width) / 2, y: (containerView!.bounds.height - presentationSize.height) / 2)
        return CGRect(origin: origin, size: presentationSize)
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        backgroundView = UIView(frame: containerView!.bounds)
        backgroundView!.backgroundColor = UIColor(red: 16.0 / 255.0, green: 16.0 / 255.0, blue: 16.0 / 255.0, alpha: 0.8)
        backgroundView!.alpha = 0.0
        containerView!.insertSubview(backgroundView!, at: 0)
        UIView.animate(withDuration: 0.3) {
            self.backgroundView!.alpha = 1.0
        }
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundView?.alpha = 0.0
        }
    }
}
