//
//  MovieTableViewController.swift
//  Tableviews_Part_1
//
//  Created by Jason Gresh on 9/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var filterByWhatchuWhatchuWaaant: UIPickerView!
    var delegate: UIPickerViewDelegate?
    var dataSource: UIPickerViewDataSource?
    
    var filterBy = ["Genre", "Century"]
    
    var row = 0
    
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
        
        
        
        
        //delegate.
        
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
    
    
    
    // MARK: - Picker view data source
    
    //I used a picker view so that I could easily go back and add more categories to filter by. It also allows the user to pick exactly what they want to filter by
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filterBy.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filterBy[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.row = row
        
        switch row {
        case 0:
            tableView.reloadData()
        case 1:
            tableView.reloadData()
        default:
            break
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        switch row {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch row {
        case 0:
            guard let genre = Genre.init(rawValue: section), let data = byGenre(genre)
                else {
                    return 0
            }
            
            return data.count
        case 1:
            guard let year = Century.init(rawValue: section), let data2 = byYear(year)
                else {
                    return 0
            }
            
            return data2.count
        default:
            return 0
        }
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch row {
        case 0:
            guard let genre = Genre.init(rawValue: indexPath.section), let data = byGenre(genre) else {return cell}
            
            cell.textLabel?.text = data[indexPath.row].title
            cell.detailTextLabel?.text = String(data[indexPath.row].year)
            
            return cell
            
        case 1:
            guard let year = Century.init(rawValue: indexPath.section), let data = byYear(year) else {return cell}
            
            cell.textLabel?.text = data[indexPath.row].title
            cell.detailTextLabel?.text = String(data[indexPath.row].year)
            
            return cell
            
        default:
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let genre = Genre.init(rawValue: section), let century = Century.init(rawValue: section) else { return "" }
        
        
        switch row {
        case 0:
            
            switch genre {
            case .action:
                return "Action"
            case .animation:
                return "Animation"
            case .drama:
                return "Drama"
            }
        case 1:
            
            switch century {
            case .twentyCentury:
                return "20th Century"
            case .twentyFirstCentury:
                return "21st Century"
            }
        default:
            return ""
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
    
    
}
