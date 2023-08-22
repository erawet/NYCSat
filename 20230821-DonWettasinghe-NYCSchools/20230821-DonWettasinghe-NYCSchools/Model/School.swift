//
//  School.swift
//  20230722-DonWettasinghe-NYCSchools
//
//  Created by Don Wettasinghe on 8/21/23.
//

import Foundation
struct School: Codable {
    let dbn: String?
    let school_name: String?
    let location: String?
    let phone_number: String?
    let fax_number: String?
    let school_email: String?
    let website: String?
    let city: String?
    let zip: String?
    let state_code: String?

    
    var satScores: SchoolSATScores? //sets the SAT Scores object
}

struct SchoolSATScores: Codable {
    let dbn: String?
    let school_name: String?
    let num_of_sat_test_takers: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}


