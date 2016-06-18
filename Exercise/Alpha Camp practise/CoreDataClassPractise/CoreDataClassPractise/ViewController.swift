//
//  ViewController.swift
//  CoreDataClassPractise
//
//  Created by WuKwok Ho on 23/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

// When you are going to use the data function and name of data, you need to "import CoreData"
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textFieldISBN: UITextField!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldAuthor: UITextField!
    
    @IBOutlet weak var textFieldPrice: UITextField!

    @IBOutlet weak var addbutton, queryall, queryone, update, deletebutton, clear: UIButton!
    
    @IBOutlet weak var textView: UITextView!
   
    // drag AppDelegate.swift two constant to viewController - reference from there. let them to do some task for view controller. 當要喺第二個ViewController呼叫另一個ViewController的function時，要用delegate去指示reference原來位置，在AppDelegate的例子中，要UIApplication.shareApplication去作為用佢地function嘅指令。
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var currentBook : Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCircle([addbutton, queryall, queryone, update, deletebutton, clear])
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.blueColor().CGColor

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func addbutton(sender: AnyObject) {
        if allTextField() {
        // 可以在UI讓User加入新data的指令 - NSEntityDescription (要先import DataCore)
        let saveBook = NSEntityDescription.insertNewObjectForEntityForName("Book", inManagedObjectContext: self.managedObjectContext) as! Book
        saveBook.isbn = textFieldISBN.text
        saveBook.author = textFieldAuthor.text
        saveBook.name = textFieldName.text
        saveBook.price = Int(textFieldPrice.text!)
        
        bookPrint([saveBook])
        } else {
            warningMessage(message: "Please Enter Your Information")
        }
        
    }
    
    @IBAction func queryall(sender: AnyObject) {
        
        // 詢問要拿取data中已被儲存的全部資料。
        let fetchRequest = NSFetchRequest(entityName: "Book")
        
        // 以"isbn"作為Primary key去儲存資料，所有data會依據"isbn"的數字排序被列出來。acsending bool 意思係true的話會小至大，false的話會大至小。
        let sortDescriptor = NSSortDescriptor(key: "isbn", ascending: true)
        
        //將所有得出來的sortDescriptor primary key，以array形式列出來 *去理解下面條function
        let sortDescriptors = [sortDescriptor]
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            let books = try (managedObjectContext.executeFetchRequest(fetchRequest) as? [Book])!
            for book in books {
                print(book.isbn!)
                print(book.author!)
                print(book.name!)
                print(book.price!)
                
                bookPrint(books)
            }
        } catch {
           // do nothing now
        }
        

    }
    
    
    
    @IBAction func queryone(sender: AnyObject) {
        // Query One 用途係：讓你利用primary Key("ISBN") 去搵其他資料，如果有該資料，可以作出更改並存進core data
        
        //*去理解下面條function
        let fetchRequest = NSFetchRequest (entityName: "Book")
        let fetchPredicate = NSPredicate(format: "isbn == %@", textFieldISBN.text!)
        fetchRequest.predicate = fetchPredicate
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Book] {
                currentBook = fetchResults.first
                
                textFieldISBN.text = currentBook?.isbn
                textFieldName.text = currentBook?.name
                textFieldAuthor.text = currentBook?.author
                textFieldPrice.text = "\((currentBook?.price)!)"
                
            }
        } catch {
        }
    }
    
    
    @IBAction func update(sender: AnyObject) {
        //為資料作出更改並存進core data
        currentBook?.isbn = textFieldISBN.text
        currentBook?.author = textFieldAuthor.text
        currentBook?.name = textFieldName.text
        currentBook?.price = Int(textFieldPrice.text!)
    }
    
    @IBAction func deletebutton(sender: AnyObject) {
        managedObjectContext.deleteObject(currentBook!)
        appDelegate.saveContext()
        
        clearUI()
    }
    
    @IBAction func clear(sender: AnyObject) {
        clearUI()
    }
    
    
    func clearUI() {
        textFieldISBN.text = ""
        textFieldPrice.text = ""
        textFieldName.text = ""
        textFieldAuthor.text = ""
        
    }
    
    func buttonCircle(buttons:[UIButton]){
        for button in buttons {
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blueColor().CGColor
        }
    }

    func bookPrint(books:[Book]) {
        var allShow = ""
        for book in books {
            var rowShow = ""
            rowShow += "ISBN: " + book.isbn! + "\n"
            rowShow += "Book Name: " + book.name! + "\n"
            rowShow += "Author: " + book.author! + "\n"
            rowShow += "Price: " + String(book.price!) + "\n\n"
            allShow += rowShow
        }
        textView.text = allShow
        textView.textColor = UIColor.whiteColor()
        textView.font = UIFont(name: "ArialMT", size: 14)
    }
    
    func warningMessage(message message:String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .Alert)
        let cancel = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func allTextField() -> Bool {
        return (textFieldName.text != "" && textFieldAuthor.text != "" && textFieldISBN != "" && textFieldPrice != "")
    }
    
}








