//
//  AddViewController.swift
//  Events
//
//  Created by devsenior on 08/04/2023.
//

import UIKit
import RealmSwift
class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var descTDF: UITextField!
    
    @IBOutlet weak var pickerDate: UIDatePicker!
    var realm = try! Realm()
     
//    var event = [Event]()
    
    var eventViewModel: EventViewModel?
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventViewModel = EventViewModel(event: Event())

    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
//         let nameField = titleTF.text!
//         let descField = descTDF.text!
//         let pickdate = pickerDate.date
//
//        let newEvent = Event(title: nameField, desc: descField, _id: "", date: pickdate)
//
//
//        try! self.realm.write {
//            self.realm.add(newEvent)
//            self.navigationController?.popViewController(animated: true)
//        }
        guard let title = titleTF.text, let desc = descTDF.text else {
                  return
              }
        let date = pickerDate.date
        let newEventId = eventViewModel?.addEvent(title: title, desc: desc, date: date)
        navigationController?.popViewController(animated: true)


        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    

}
