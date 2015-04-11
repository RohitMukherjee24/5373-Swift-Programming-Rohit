//
//  SecondViewController.swift
//  MyLocations
//
//  Created by Terry Griffin on 3/24/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import MapKit


class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewWillAppear(animated: Bool) {
        // Get a reference to the model data from the custom tab bar controller.
        let model = (self.tabBarController as CustomTabBarController).model
        
        var location = CLLocationCoordinate2D(
            latitude: model.latitude,
            longitude: model.longitudes
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
       var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = ""
        annotation.subtitle = ""
        //var overlay = MKCircle (centerCoordinate: location, radius: 500)
        
        //mapView.addOverlay(overlay)
       mapView.addAnnotation(annotation)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // self.title.text = self.annotation.title;
      // self.subtitleLabel.text = self.annotation.subtitle;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

