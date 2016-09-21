//
//  MovieTableViewController.swift
//  Tableviews_Part_1
//
//  Created by Louis Tur on 9/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    // 1. Set up some variables and set the cellIdentifier
    internal var movieData: [Movie]?
    internal let rawMovieData: [[String : Any]] = movies
    let cellIdentifier: String = "MovieTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reel Good!"
//        self.tableView.backgroundColor = UIColor.blue
        
        // 2. parse our movie data and set it to our instance var
        var movieContainer: [Movie] = []
        for rawMovie in rawMovieData {
            movieContainer.append(Movie(from: rawMovie))
        }
        movieData = movieContainer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // We're only going to need 1 section for our limited data
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // let's use the nil coalescing operator to guard against crashes in our tableview's early lifecycle
        return self.movieData?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3. Where did this cellIdentifier come from? 
        // And why do we even need it? 
        // And what about the cell style?
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // 4. And configure our cell
        if let movieAtIndexPath: Movie = self.movieData?[indexPath.row] {
            cell.textLabel?.text = "\(movieAtIndexPath.title as String) - \(movieAtIndexPath.year as Int)"
            cell.detailTextLabel?.text = movieAtIndexPath.summary
        }

        return cell
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
