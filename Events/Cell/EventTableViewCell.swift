//
//  EventTableViewCell.swift
//  Events
//
//  Created by devsenior on 08/04/2023.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLb: UILabel!
    
    @IBOutlet weak var descLb: UILabel!
    
    @IBOutlet weak var dateLb: UILabel!
    
    func configure(with viewModel: EventViewModel) {
            titleLb.text = viewModel.title
            descLb.text = viewModel.desc
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            let dateString = dateFormatter.string(from: viewModel.date!)
            dateLb.text = dateString
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    

}
