//
//  CustomNavigationController.swift
//  Vkontakte
//
//  Created by Сергей on 22.10.2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

//class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
//    var hasStarted = false
//    var shouldFinish = false
//}

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    let transitionAnimator = CustomAnimator()
    //let interactiveTransition = CustomInteractiveTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return PushAnimator()
        case .pop:
            return PopAnimator()
        default:
            return nil
        }
    }
    
//    func navigationController(_ navigationController: UINavigationController,
//                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return interactiveTransition
//    }

}
