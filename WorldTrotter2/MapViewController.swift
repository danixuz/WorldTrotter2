//
//  MapViewController.swift
//  WorldTrotter2
//
//  Created by Daniel Spalek on 12/08/2022.
//


// MARK: This is an additional view controller for the map view controller in the storyboard. so we can add code to it.

import UIKit // we allow this file to use anything that's publicly declared within the UIKit framework.
import MapKit // for the map view

class MapViewController: UIViewController {
    
    var mapView: MKMapView! // We will need a reference to the map view later on, so we create a property for it as well.
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller.
        view = mapView
        
        // Make top menu buttons for map view
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false // The line of code regarding translating constraints has to do with an older system for scaling interfaces – autoresizing masks. Before Auto Layout was introduced, iOS applications used autoresizing masks to allow views to scale for different-sized screens at runtime.
        
        // Attaching a target-action pair to the segmented control
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        // add menu as subview.
        view.addSubview(segmentedControl)
        
        
        // Adding layout constraints for the segmented control
//        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8) // We want it below the sensor housing and status bar. we want it 8 points below the top anchor of the safe area.
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        // We will use margins.
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        // Activate the constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    override func viewDidLoad() {
        print("MapViewController finished loading it's view")
    }
    
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
}
// UIViewController is a class defined in the UIKit framework. each view controller inherits a special property: var view: UIView!
