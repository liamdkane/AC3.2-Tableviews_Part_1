# C4Q Movie Reel 
### (AC3.2-Tableviews_Part_1: **Intro to Tableviews**)
---

### Whip it, *Reel Good*!
Turns out, Access Code has partnered with a local media company that specializes in movie databases named *Reel Good Media*. *Reel Good* is a scrappy young startup that's looking to add to its mobile presence with a clean, functional app that can display info they store in their database. In this partnership, Access Code will help Reel Good develop their app to their specifications. 

In this first draft of the app, Reel Good wants a simple prototype that they can test and give feedback on. According to Reel Good, their ideal MVP ([minimum viable product](https://en.wikipedia.org/wiki/Minimum_viable_product)) would have: 

1. A `UINavigationBar` at the top
2. A `UITableView` to list data from a subset of their database info 
3. `UITableViewCell`s large enough to be able to list the `title`, `year` and `synopsis` of their movies

Your team of developers have also figured out that in order to be able to populate data from Reel Good's database, you will need a way to parse their database data into:

1. A `Movie` object
2. A `Actor` object

---

### Goals
1. Become familiar with adding various UI elements to a storyboard 
  2. `UINavigationController` ([Apple Docs](https://developer.apple.com/reference/uikit/uinavigationcontroller))
  3. `UITableViewController` ([Apple Docs](https://developer.apple.com/reference/uikit/uitableviewcontroller))
2. Understand how `UITableView`s efficiently display and manage data in `UITableViewCell`s (["A Closer Look at Table View Cells"](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/TableViewCells/TableViewCells.html#//apple_ref/doc/uid/TP40007451-CH7))
3. Learn how to populate and display data in `UITableView` by way of its delegate protocols
  4. `UITableViewDataSource` ([Apple Docs](https://developer.apple.com/reference/uikit/uitableviewdatasource))
  5. `UITableViewDelegate` ([Apple Docs](https://developer.apple.com/reference/uikit/uitableviewdelegate))
4. Further your understanding of protocols ([Swift 3 - Protocols](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html))

---

### Instructions

#### 1. Storyboard Setup

1. Open the project labeled `Tableviews_Part_1.xcodproj` and get familiar with the structure of the project
  - You'll notice that the project is divided into a few folders, and that your `Movie` and `Actor` Swift files are made for you, but are currently empty. The storyboard should also be blank. 
  - If you tried to run the project now, you'd simple see a black screen in your simulator, but you should be able to see a splash screen with the app's logo before that. 
2. Click on `Main.storyboard` to open the file in your main window.
3. Add a `UITableviewController` by dragging it over into the editor window from the *Object Library* in the *Utilies Area*
4. *Embed* a `UINavigationController` now (Editor > Embed In > Navigation Controller)
  - Try running the project now
  - **Is Initial View Controller**
5. With the `UITableViewController` selected in the storyboard, take a look at the *Identity Inspector* in the *Utilities Area* 
  - We'll need to change this to our own custom class 
6. Create a new file (File > New File > Cocoa Touch Class)
  - Named `MovieTableViewController`
  - Subclass of `UITableviewController`
  - Select the correct folder and group! 
7. Lots of template code! (Delete almost all of it)
8. Go back to our storyboard and switch the `UITableViewController`'s class to our newly created subclass
9. To make sure we've got everything hooked up right, add the following code to `viewDidLoad()` in `MovieTableViewController`:

	```
	self.title = "Reel Good!"
    self.tableView.backgroundColor = UIColor.blue
    ```

