import UIKit

class MainTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let isPresenting: Bool
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animatePresentationWithTransitionContext(transitionContext)
        } else {
            animateDismissalWithTransitionContext(transitionContext)
        }
    }
    
    // MARK: - Animations
    
    private func animatePresentationWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        let containerView = transitionContext.containerView
        let animationDuration = transitionDuration(using: transitionContext)
        
        presentedControllerView.layer.shadowColor = UIColor.black.cgColor
        presentedControllerView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        presentedControllerView.layer.shadowOpacity = 0.5
        presentedControllerView.layer.cornerRadius = 20
        presentedControllerView.clipsToBounds = true
        
        presentedControllerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        presentedControllerView.alpha = 0.0
        
        containerView.addSubview(presentedControllerView)
        
        UIView.animate(withDuration: animationDuration, animations: {
            presentedControllerView.transform = CGAffineTransform.identity
            presentedControllerView.alpha = 1.0
        }, completion: { (completed) in
            transitionContext.completeTransition(completed)
        })
    }
    
    private func animateDismissalWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let animationDuration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: animationDuration, animations: {
            presentedControllerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            presentedControllerView.alpha = 0.0
        }, completion: { (completed) -> Void in
            presentedControllerView.removeFromSuperview()
            transitionContext.completeTransition(completed)
        })
    }
}
