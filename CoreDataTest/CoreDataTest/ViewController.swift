//
//  ViewController.swift
//  CoreDataTest
//
//  Created by WANGMING-LIANG on 3/22/16.
//  Copyright © 2016 Fone Shaking. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var textFieldISBN: UITextField!
    @IBOutlet weak var textFieldBookName: UITextField!
    @IBOutlet weak var textFieldAuthor: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var currentBook: Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func insertBook(sender: AnyObject) {
        let saveBook = NSEntityDescription.insertNewObjectForEntityForName("Book", inManagedObjectContext: self.managedObjectContext) as! Book
        saveBook.isbn = textFieldISBN.text
        saveBook.name = textFieldBookName.text
        saveBook.author = textFieldAuthor.text
        saveBook.price = Int(textFieldPrice.text!)
        
        appDelegate.saveContext()
    }
    
    @IBAction func queryOneBook(sender: AnyObject) {
        let fetchRequest = NSFetchRequest(entityName: "Book")
        let fetchPredicate = NSPredicate(format: "isbn == %@", textFieldISBN.text!)
        fetchRequest.predicate = fetchPredicate
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Book] {
                currentBook = fetchResults.first
                
                textFieldISBN.text = currentBook?.isbn
                textFieldBookName.text = currentBook?.name
                textFieldAuthor.text = currentBook?.author
                textFieldPrice.text = "\((currentBook?.price)!)"
            }
            
        } catch {
            
        }
        
    }
    
    @IBAction func updateOneBook(sender: AnyObject) {
        currentBook?.isbn = textFieldISBN.text
        currentBook?.name = textFieldBookName.text
        currentBook?.author = textFieldAuthor.text
        currentBook?.price = Int(textFieldPrice.text!)
        
        appDelegate.saveContext()
    }

    @IBAction func deleteOneBook(sender: AnyObject) {
        managedObjectContext.deleteObject(currentBook!)
        appDelegate.saveContext()
        
        clearUI()
    }

    @IBAction func queryAllBook(sender: AnyObject) {
        // Create a new fetch request using the Box entity
        let fetchRequest = NSFetchRequest(entityName: "Book")
        let sortDescriptor = NSSortDescriptor(key: "isbn", ascending: false)
        let sortDescriptors = [sortDescriptor]
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            let books = try (managedObjectContext.executeFetchRequest(fetchRequest) as? [Book])!

            for book in books {
                print(book.isbn!)
            }
        } catch {
            // do nothing now
        }
    }
    
    @IBAction func clearUI(sender: AnyObject) {
        clearUI()
    }
    
    func clearUI() {
        textFieldISBN.text = ""
        textFieldBookName.text = ""
        textFieldAuthor.text = ""
        textFieldPrice.text = "0"
    }
}

