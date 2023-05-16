//
//  EditViewController.swift
//  Events
//
//  Created by devsenior on 08/04/2023.
//

import UIKit
import RealmSwift
class EditViewController: UIViewController {
    var eventEdit: Event?

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var descTDF: UITextField!
    
    @IBOutlet weak var pickerDate: UIDatePicker!
    var realm = try! Realm()
     
    var event = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTF.text = eventEdit?.title ?? ""
        descTDF.text = eventEdit?.desc ?? ""
        pickerDate.date = eventEdit?.date ?? Date.now
        titleTF.becomeFirstResponder()

    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
      print("save")
      do {
          try realm.write({
              eventEdit?.title = titleTF.text ?? ""
              eventEdit?.desc = descTDF.text ?? ""
              eventEdit?.date = pickerDate.date
          })
      } catch {
          print(error.localizedDescription)
      }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
