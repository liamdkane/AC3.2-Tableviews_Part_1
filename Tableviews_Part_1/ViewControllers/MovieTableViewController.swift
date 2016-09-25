//
//  MovieTableViewController.swift
//  Tableviews_Part_1
//
//  Created by Jason Gresh on 9/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var filterByGenre = true
    
    enum Genre: Int {
        case animation
        case action
        case drama
    }
    
    enum Century: Int {
        case twentyCentury
        case twentyFirstCentury
    }
    
    internal var movieData: [Movie]?
    
    internal let rawMovieData: [[String : Any]] = movies
    let cellIdentifier: String = "MovieTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Movies"
        self.tableView.backgroundColor = UIColor.blue
        
        // converting from array of dictionaries
        // to an array of Movie structs
        var movieContainer: [Movie] = []
        for rawMovie in rawMovieData {
            movieContainer.append(Movie(from: rawMovie))
        }
        movieData = movieContainer
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if filterByGenre {
            return 3
        } else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filterByGenre {
        guard let genre = Genre.init(rawValue: section), let data = byGenre(genre)
            else {
                return 0
        }
        
        return data.count
        }
        guard let year = Century.init(rawValue: section), let data2 = byYear(year)
            else {
                return 0
        }
        
        return data2.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if filterByGenre {
        guard let genre = Genre.init(rawValue: indexPath.section), let data = byGenre(genre)
            else {
                return cell
            }
            cell.textLabel?.text = data[indexPath.row].title
            cell.detailTextLabel?.text = String(data[indexPath.row].year)
            
            return cell
        }
        guard let year = Century.init(rawValue: indexPath.section), let data = byYear(year)
            else {
                return cell
        }
        
        cell.textLabel?.text = data[indexPath.row].title
        cell.detailTextLabel?.text = String(data[indexPath.row].year)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if filterByGenre {
        guard let genre = Genre.init(rawValue: section) else { return "" }
        
        switch genre {
        case .action:
            return "Action"
        case .animation:
            return "Animation"
        case .drama:
            return "Drama"
        }
        }
        guard let century = Century.init(rawValue: section) else { return "" }
        
        switch century {
        case .twentyCentury:
            return "20th Century"
        case .twentyFirstCentury:
            return "21st Century"
        }
    }
    
    func byGenre(_ genre: Genre) -> [Movie]? {
        let filter: (Movie) -> Bool
        switch genre {
        case .action:
            filter = { (a) -> Bool in
                a.genre == "action"
            }
        case .animation:
            filter = { (a) -> Bool in
                a.genre == "animation"
            }
        case .drama:
            filter = { (a) -> Bool in
                a.genre == "drama"
            }
            
        }
        
        
        // after filtering, sort
        let filtered = movieData?.filter(filter).sorted {  $0.year < $1.year }
        
        return filtered
    }
    
    
    func byYear(_ century: Century) -> [Movie]? {
        let filter: (Movie) -> Bool
        switch century {
        case .twentyCentury :
            filter = {(a) -> Bool in a.year < 2000}
            
        case .twentyFirstCentury:
            filter = {(a) -> Bool in a.year >= 2000}
        }
        
        let filtered = movieData?.filter(filter).sorted(by: {$0.year < $1.year})
        
        return filtered
    }
    
    //I would ideally like to use a drop down menu with options on what to pick
    
    @IBAction func toggleFilter(_ sender: UIBarButtonItem) {
        
        
        if filterByGenre {
            filterByGenre = false
        } else {
            filterByGenre = true
        }
        
        
        tableView.reloadData()        
    }
    
}
