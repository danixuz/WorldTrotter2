//
//  ViewController.swift
//  WorldTrotter2
//
//  Created by Daniel Spalek on 11/08/2022.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    // Create the gradient layer
//    let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusMeasurement: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    // We want to show a precision up to one fractional digit so we will use number formatter:
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    // MARK: You are using a closure to instantiate the number formatter. A NumberFormatter is created with the .decimal style, configured to display no more than one fractional digit. You will learn more about this syntax for declaring properties in Chapter 13.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do more after view controller's view FINISHES loading.
        
        print("ConversionViewController finished loading it's view")
        
        updateCelsiusLabel()
        
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
    
    func updateCelsiusLabel() {
        if let celsiusMeasurement = celsiusMeasurement {
//            celsiusLabel.text = "\(celsiusMeasurement.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusMeasurement.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // to prevent decimal seperator
        let existingHasDecimalSeperator: [Range<String.Index>]? = textField.text?.ranges(of: ".")
        
        let replacementStringHasDecimalSeperator: [Range<String.Index>]? = string.ranges(of: ".")
        
        if existingHasDecimalSeperator != nil, replacementStringHasDecimalSeperator != nil {
            return false
        } else {
            return true
        }
        
         // Build and run the application. Attempt to enter multiple decimal separators; the application will reject the second decimal separator that you enter.

    }
    
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
//        if let text = textField.text, !text.isEmpty {
//            celsiusLabel.text = text
//        } else {
//            celsiusLabel.text = "???"
//        }
        
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
        // You can validate multiple conditions within an if statement using a comma to separate the conditions; this acts as an “and.” If the text field has text and that text is not empty, it will be set on the celsiusLabel. If either of those conditions are not true, then the celsiusLabel will be given the string ???.
        
        
        // The default event for text fields is .editingDidBegin but we are interested in .editingChanged instead.
        // (For buttons it is .touchUpInside, for segmented control it is .valueChanged)
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
}

