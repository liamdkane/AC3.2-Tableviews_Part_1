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

#### 2. Intro To Tests

When you have very large development teams and large code bases, it's tough to make changes without some unintended side effect. What you might consider a small change to the code in a single file, can sometimes have far reaching consequence in some other very different part of an app. So, how can we ensure that changes we make don't break something elsewhere? 

Testing. 

Testing is simply writing code to make sure that other code works as intended. There are some very strong and developed opinions on how to test and reasons why testing should be done. Developers can be very split on the subject, but it certainly is wise to know what's possible with testing and why it adds value. 

In testing, you take a known *input* and *assert* a particular *output* should happen. For example, in parsing Reel Good's data from their database we want to make sure that the data is formatted correctly for our app. It's possible that their database changes how it stores its data and it has an effect in our app because we can no longer parse it correctly. Testing is also very useful in another way: you know what the answer *should* be, so when something does break you already know the correct answer to the issue -- you just need to figure out how to get the code to make that correct answer happen. This process of *reverse engineering* can be very helpful in debugging and understanding code in general. 

Testing in Swift is done via the `XCTest` framework, and this project has a simple example of how testing works (`Tableviews_Part_1Tests.swift`). There are a few points that are important to remember: 
- Testing is run separately from Building and Running (meaning, your project can Run but still not pass its tests)
- Testing is started with Product > Test or with Cmd+U
- All functions in a test begin with the word "test" followed by a description of what the function will be testing
- It is important that test functions describe very well what they test, and that the failure messages will help you debug the problem
- A test can be written incorrectly, just like any other piece of code! 

Otherwise, a test class and its functions are like any other class/function in Swift! 

---

##### 3. Models and Tests

Fortunately for us, another member of our developer team working on the Reel Good project wrote out some tests on our models, `Movie` and `Actor`. Unfortunately... they didn't stage their changes in git for the actual parsing code for the model class. Not only that, they didn't save their local changes either! 

What this means, is that we're going to have to reverse engineer a solution to parsing our data based on the tests that they had written. 