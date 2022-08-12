//
//  ViewController.swift
//  WorldTrotter2
//
//  Created by Daniel Spalek on 11/08/2022.
//

import UIKit

class ViewController: UIViewController {
    // Create the gradient layer
//    let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do additional stuff after the view loaded.
        
        // MARK: Creating tab bar programmaticaly and settings an tab bar item's image.
//        let tabBar = UITabBarController()
//        tabBar.tabBar.items![0].image = UIImage(systemName: "map") // we know for sure that the items array ([UITabBarItem]?) of the tab bar is not nil, that is why we can force unwrap safely.
        
        // Choosing gradient color
//        gradientLayer.colors = [
//            UIColor.purple.cgColor,
//            UIColor.blue.cgColor,
//            UIColor.green.cgColor,
//            UIColor.yellow.cgColor,
//            UIColor.red.cgColor
//        ]
        // Rotating the gradient layer 180 degrees ( pi / 4 radians).
        //        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 4, 0, 0, 1)
        
        // NOW WE ADD IT AS SUB LAYER
//        view.layer.insertSublayer(gradientLayer, at: 0) // This will insrt it as sub layer (sub-view) in the safe area. This is where we want it.
        //        view.layer.insertSublayer(gradientLayer, at: 1) // This will insert it as a sub layer and will hide the "212"
        //        view.layer.insertSublayer(gradientLayer, at: 2) // This will insert it as a sub layer and will hide the "212" and the "degrees Fahrenheit".
        
        //        view.layer.insertSublayer(gradientLayer, above: view.layer) // Will put it above the entire layer ( all of the subviews ).
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        // To position the layer we set the layer's frame to be the same as the bounds of the view controller's view.
//        let mainViewBounds = view.bounds
//        gradientLayer.frame = mainViewBounds
        
        // Because layer do not participate in Auto Layout in the same way that views do, we want to update the layer's frame in the view controller's viewWillLayoundSubviews() method.
    }
    
}

