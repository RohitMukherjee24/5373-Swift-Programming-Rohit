//
//  MyLocations.Location.swift
//  MyLocations
//
//  Created by R. Mukherjee on 4/8/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import Foundation
import CoreData

class MyLocations_Location: NSManagedObject {

    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var date: NSTimeInterval
    @NSManaged var locationDescription: String
    @NSManaged var category: String
    @NSManaged var placemark: AnyObject

}
