//
//  ViewController.swift
//  ForgottenTulsa
//
//  Created by Jeffery Mason on 11/16/19.
//  Copyright © 2019 Jeffery Mason. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
      var selectedOptions : [HiddenGemsType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      // Set initial location to Tulsa
        let initialLocation = CLLocation(latitude: 36.153980, longitude: -95.992775)

        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegoin = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegoin, animated: true)

        }
        
        centerMapOnLocation(location: initialLocation)
    }
    
    func loadSelectedOptions() {

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      (segue.destination as? ViewController)?.selectedOptions = selectedOptions
    }
    
    @IBAction func closeOptions(_ exitSegue: UIStoryboardSegue) {
      guard let vc = exitSegue.source as? ViewController else { return }
      selectedOptions = vc.selectedOptions
      loadSelectedOptions()
    }
    // Switch the map type.
    
    @IBAction func mapTypeChanged(_ sender: UISegmentedControl) {
        
        mapView.mapType = MKMapType.init(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard
    }
    
}

