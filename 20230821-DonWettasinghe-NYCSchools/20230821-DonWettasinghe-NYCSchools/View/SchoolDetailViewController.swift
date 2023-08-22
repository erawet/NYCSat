//
//  SchoolDetailViewController.swift
//  20230722-DonWettasinghe-NYCSchools
//
//  Created by Don Wettasinghe on 8/21/23.
//

import UIKit

class SchoolDetailViewController: UIViewController {

    @IBOutlet weak var writingLabel: UILabel!
    @IBOutlet weak var mathSATScoreLabel: UILabel!
    @IBOutlet weak var readingSATScoreLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var fax: UILabel!
    @IBOutlet weak var webButton: UIButton!
    
    @IBOutlet weak var webLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func loadDetailView(_ school: School){
                
        schoolNameLabel.text = school.school_name
        city.text = school.city
        phone.text = school.phone_number
        fax.text = school.fax_number
        webButton.titleLabel?.text = school.website
        webLbl.text  = school.website
        
        if let readingScore = school.satScores?.sat_critical_reading_avg_score{
            readingSATScoreLabel.text =  readingScore
        }
        
        if let writingScore = school.satScores?.sat_writing_avg_score{
            writingLabel.text = writingScore
        }
        
        if let mathsScore = school.satScores?.sat_math_avg_score{
            mathSATScoreLabel.text =  mathsScore
        }
    }
    
    @IBAction func webButonClick(_ sender: UIButton) {
        let urlheader = "https://"
        guard let settingsUrl = URL(string: urlheader+(sender.titleLabel?.text ?? "")) else {
                return
            }
            
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        
    }
    

}
