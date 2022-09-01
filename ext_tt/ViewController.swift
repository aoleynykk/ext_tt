//
//  ViewController.swift
//  ext_tt
//
//  Created by Олександр Олійник on 01.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTitleTextField: UITextField!
    
    @IBOutlet weak var movieYearTextField: UITextField!
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var movieTitles: [String] = []
    
    var movieYears: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if movieTitleTextField.text != "" && movieYearTextField.text != "" {
            if movieTitles.contains(movieTitleTextField.text!) {
                makeAlert(alerTitle: "Error", message: "The Table already contains such movie!", buttonTitle: "Try Again")
            } else {
                movieTitles.append(movieTitleTextField.text!)
                let movieYear = NSString(string: movieYearTextField.text!).intValue
                movieYears.append(Int(movieYear))
                movieTitleTextField.text = ""
                movieYearTextField.text = ""
            }
        }
        else {
            makeAlert(alerTitle: "Error", message: "Not all fields are filled!", buttonTitle: "Try Again")
        }
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    private func makeAlert(alerTitle: String, message: String, buttonTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in }
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.setup(title: movieTitles[indexPath.row], year: movieYears[indexPath.row])
        return cell
    }
}
