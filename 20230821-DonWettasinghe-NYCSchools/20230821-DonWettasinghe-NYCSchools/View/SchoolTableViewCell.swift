//
//  SchoolTableViewCell.swift
//  20230722-DonWettasinghe-NYCSchools
//
//  Created by Don Wettasinghe on 8/21/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    static let identifier = "SchoolTableViewCell"
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    var school: School! {
        didSet {
            schoolNameLabel.text = school.school_name
            email.text = school.school_email
            phone.text = school.phone_number
        }
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
