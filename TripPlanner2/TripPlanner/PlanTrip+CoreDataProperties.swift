//
//  PlanTrip+CoreDataProperties.swift
//  TripPlanner
//
//  Created by KaL on 11/8/15.
//  Copyright © 2015 KaL. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PlanTrip {

    @NSManaged var name: String?
    @NSManaged var waypoint: NSSet?

}
