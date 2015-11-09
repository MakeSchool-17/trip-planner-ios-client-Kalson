//
//  CoreDataHelper.swift
//  TripPlanner
//
//  Created by KaL on 11/7/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    static let singleInstance = CoreDataHelper()
    
    static let managedObjectContext = CoreDataStack(stackType: .SQLite).managedObjectContext
    
    static private func saveContext() {
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    static func saveTrip(name: String) {
        let trip: PlanTrip = NSEntityDescription.insertNewObjectForEntityForName("PlanTrip", inManagedObjectContext: managedObjectContext) as! PlanTrip
        
        trip.name = name
        
        saveContext()
    }
    
    static func allTrips() -> [PlanTrip] {
        let fetchRequest = NSFetchRequest(entityName: "PlanTrip")
        
        var result = [PlanTrip]()
        
        do {
            result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [PlanTrip]
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return result
    }
    
    static func saveWaypoint(trip: PlanTrip, latitude: Float, longitude: Float, name: String) {
        let waypoint: WayPoint = NSEntityDescription.insertNewObjectForEntityForName("Waypoint", inManagedObjectContext: managedObjectContext) as! WayPoint
        
        waypoint.name = name
        waypoint.longitude = longitude
        waypoint.latitude = latitude
        waypoint.trip = trip
        
        saveContext()
    }
    
    static func allWaypoints(trip: PlanTrip) -> [WayPoint] {
        let fetchRequest = NSFetchRequest(entityName: "Waypoint")
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "trip", trip)
        
        var result = [WayPoint]()
        
        do {
            result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [WayPoint]
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return result
    }
    
}
