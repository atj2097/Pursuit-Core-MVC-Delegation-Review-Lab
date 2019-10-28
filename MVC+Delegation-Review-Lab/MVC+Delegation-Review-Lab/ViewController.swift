//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController, UITableViewDataSource, fontSize {
    
    @IBOutlet var tableView: UITableView!
    var newFontSize = CGFloat()
    var movie = Movie.allMovies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func changeFontSize(size: Float) {
        newFontSize = CGFloat(size)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = movie[indexPath.row].name
        cell.detailTextLabel?.text = "\(movie[indexPath.row].genre)"
        cell.textLabel?.font = UIFont(name: "Helvetica", size: newFontSize)
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? StepperViewController else {fatalError()}
        destination.delegate = self
        destination.currentValue = Float(newFontSize)
    }
    
}


