//
//  RoundingTransition.swift
//  FilmsApp
//
//  Created by Владислав  on 11.09.2024.
//

import Foundation
import UIKit

class RoundingTransition: NSObject {
    
    var round = UIView()
    
    var start = CGPoint.zero {
        didSet{
            round.center = start
        }
    }
    
    var roundColor = UIColor.red
    
    enum RoundingTransitionProfile {
        case show, cancel, pop
    }
    
    var transitionProfile: RoundingTransitionProfile = .show
}

extension RoundingTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return time
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        if transitionProfile == .show {
            if let showedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                
                let viewCenter = showedView.center
                let viewSize = showedView.frame.size
                
                round = UIView()
                round.frame = roundFrame(withViewCenter: viewCenter, size: viewSize, startPoint: start)
            }
        } else {
            
        }
    }
    
    func roundFrame(withViewCenter viewCenter: CGPoint, size viewSize: CGSize, startPoint: CGPoint) -> CGRect {
        
    }
    
}
