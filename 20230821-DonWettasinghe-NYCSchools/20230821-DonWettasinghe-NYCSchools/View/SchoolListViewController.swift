//
//  ViewController.swift
//  20230722-DonWettasinghe-NYCSchools
//
//  Created by Don Wettasinghe on 8/21/23.
//

import UIKit

class SchoolListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SchoolListViewModel?
    
    var alertController: UIAlertController? //To display "Fetching"
    var isAnimating = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SchoolListViewModel(self)
        self.navigationItem.title = "NYC School List"
      
        
        //for first time.
        self.startAnimation()
    }
    
    //Animate view while fetching results.
    func startAnimation(){
      
        if (self.isAnimating == false){
            self.isAnimating = true
            
            //Utilties is the Objective - C class. Which creates a Generic Alert for now.
            self.alertController = Utilities.getAlertController("Fetching Schools…")
            present(self.alertController!, animated: true, completion: nil)
        }
      
    }
    
    func stopAnimation(){
      
        self.alertController?.dismiss(animated: true, completion: nil)
        self.alertController = nil
        self.isAnimating = false
       
    }
    
    //Function to throw alert.
    func displayAlert(_ error: Error) {
        
        DispatchQueue.main.async{
            self.dismiss(animated: false) {
                OperationQueue.main.addOperation {
                    print("Error while fetching Schools.")
                    print(error.localizedDescription)
                    
                    let alert = UIAlertController(title: "Error while fetching details.", message: "\(error.localizedDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                        print("Error while fetching details.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let school = sender as? School {
            let detailsView = segue.destination as? SchoolDetailViewController
            detailsView?.view.tag = 0   //Setting the tag as example so that view loads it hierarchy.
            detailsView?.loadDetailView(school)
        }
    }

}

extension SchoolListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.identifier) as! SchoolTableViewCell
            cell.school = viewModel!.data(forRowAt: indexPath)
                
        return cell
    }
}

extension SchoolListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = viewModel!.data(forRowAt: indexPath)
        self.performSegue(withIdentifier: "mainToDetailSegue", sender: school)
    }
}

extension SchoolListViewController: SchoolListViewControllerDelegate {

    func fetchSchoolListSuccess(_ failedError: Error?){
        
        if let error = failedError {
            self.displayAlert(error)
        }else{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.stopAnimation()
            }
        }
    }
    
    func fetchSATSuccess(_ failedError: Error?){
        if let error = failedError {
            self.displayAlert(error)
        }
    }
}

extension String {
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
