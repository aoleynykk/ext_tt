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
    
    var movies: NSMutableOrderedSet = []
    
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        id += 1
        if movieTitleTextField.text != "" && movieYearTextField.text != "" {
            if movies.contains(where: { movie in
                let movieYear = NSString(string: movieYearTextField.text!).intValue
                return (movie as! Movie).title == movieTitleTextField.text! && (movie as! Movie).year == Int(movieYear)
            }) {
                makeAlert(alerTitle: "Error", message: "The Table already contains such movie!", buttonTitle: "Try Again")
            } else {
                let movieYear = NSString(string: movieYearTextField.text!).intValue
                movies.add(Movie(id: id, title: movieTitleTextField.text!, year: Int(movieYear)))
                let indexPaths = IndexPath(row:(movies.count - 1), section: 0)
                moviesTableView.insertRows(at: [indexPaths], with: .left)
                movieTitleTextField.text = ""
                movieYearTextField.text = ""
            }
        }
        else {
            makeAlert(alerTitle: "Error", message: "Not all fields are filled!", buttonTitle: "Try Again")
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
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = moviesTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            cell.setup(with: movies[indexPath.row] as! Movie)
            return cell
        }
        return UITableViewCell()
    }
}
