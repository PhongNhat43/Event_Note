//
//  ViewModel.swift
//  Events
//
//  Created by devsenior on 20/04/2023.
//

import Foundation
import RealmSwift
class EventViewModel {
    
    var event: Event
       var title: String?
       var desc: String?
       var date: Date?
       
       init(event: Event) {
           self.event = event
           self.title = event.title
           self.desc = event.desc
           self.date = event.date
       }
//    func updateEvent(event: Event) -> Event {
//        var updatedEvent = event
//        updatedEvent.title = self.title
//        updatedEvent.desc = self.desc
//        updatedEvent.date = self.date
//        return updatedEvent
//    }
//
//    let realm = try! Realm()
//
//        var events: Results<Event> {
//            return realm.objects(Event.self)
//        }
//
//        func addEvent(title: String, desc: String, date: Date) {
//            let event = Event()
//            event.title = title
//            event.desc = desc
//            event.date = date
//
//            try! realm.write {
//                realm.add(event)
//            }
//        }
//
//        func deleteEvent(event: Event) {
//            try! realm.write {
//                realm.delete(event)
//            }
//        }
    let realm = try! Realm() // create a Realm instance
        
        // Function to add a new event to the database
        func addEvent(title: String, desc: String, date: Date) {
            let newEvent = Event(title: title, desc: desc, _id: "", date: date)
            
            try! realm.write {
                realm.add(newEvent)
            }
        }
        
        // Function to remove an event from the database
    // Function to remove an event from the array and database
    func removeEvent(at indexPath: IndexPath) {
        let eventToRemove = events[indexPath.row]
        try! realm.write {
            realm.delete(eventToRemove)
        }
        events.remove(at: indexPath.row)
    }

        
        // Function to update an existing event in the database
        func updateEvent(event: Event, title: String?, desc: String?, date: Date?) {
            try! realm.write {
                if let newTitle = title {
                    event.title = newTitle
                }
                if let newDesc = desc {
                    event.desc = newDesc
                }
                if let newDate = date {
                    event.date = newDate
                }
            }
        }
    
    
    
    
}

