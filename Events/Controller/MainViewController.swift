//
//  ViewController.swift
//  Events
//
//  Created by devsenior on 02/04/2023.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
   var realm = try! Realm()
    
    var event:[Event] = []
//    var eventViewModel = EventViewModel()
//    var events: [Event] = []
    
    var selectedEvent: Event?
    
    var eventViewModel: EventViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // realm database
//        load()
        event = Array(realm.objects(Event.self))
     
        print(realm.configuration.fileURL?.path)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableview.reloadData()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventTableViewCell
//        cell.textLabel?.text = event[indexPath.row].title
//        cell.detailTextLabel?.text = event[indexPath.row].desc
//        let item = event[indexPath.row]
//        cell.titleLb?.text = item.title
//        cell.descLb?.text = item.desc
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let dateString = dateFormatter.string(from: item.date)
//        cell.dateLb.text = "\(dateString)"
//       cell.eventImage?.image = UIImage(data: (event[indexPath.row].image as? Data)!)
        let eventViewModel = EventViewModel(event: event[indexPath.row])
        cell.configure(with: eventViewModel)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 500
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Create delete action
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
//            guard let self = self else { return }
//
//            let event = self.event[indexPath.row]
//
//            do {
//                try self.realm.write {
//                    self.realm.delete(event)
//                }
//                self.tableview.reloadData()
//            } catch {
//                print("Error deleting event: \(error.localizedDescription)")
//            }
//
//            completionHandler(true)
//        }
        
        // Add delete action to configuration
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//        let delete = UIContextualAction(style: .normal, title: "Delete") { [self] _, _, _ in
//            if let eventDelete = event[indexPath.row] as? Event {
//                self.realm.beginWrite()
//                self.realm.delete(eventDelete)
//            do {
//                try self.realm.commitWrite()
//            } catch {
//                print(error.localizedDescription)
//            }
//                self.event.remove(at: indexPath.row)
//                self.tableview.reloadData()
//            }
//        }
//
//        delete.backgroundColor = .red
//        return UISwipeActionsConfiguration(actions: [delete])
    
//    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeEvent(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedEvent = event[indexPath.row]
//        let alertController = UIAlertController(title: "Edit Event", message: nil, preferredStyle: .alert)
//        alertController.addTextField { textField in
//            textField.text = self.selectedEvent?.title
//        }
//        alertController.addTextField { textField in
//            textField.text = self.selectedEvent?.desc
//        }
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
//            guard let title = alertController.textFields?.first?.text, let desc = alertController.textFields?.last?.text else {
//                return
//            }
//            try! self.realm.write {
//                self.selectedEvent?.title = title
//                self.selectedEvent?.desc = desc
//                self.realm.add(self.selectedEvent!, update: .modified)
//            }
//            self.tableview.reloadData()
//        }))
//        present(alertController, animated: true)
//    }
        tableview.deselectRow(at: indexPath, animated: true)
        selectedEvent = event[indexPath.row]
        performSegue(withIdentifier: "edit", sender: self)
        
    
        
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let edit = segue.destination as! EditViewController
            edit.eventEdit = selectedEvent
        }
    }

}
