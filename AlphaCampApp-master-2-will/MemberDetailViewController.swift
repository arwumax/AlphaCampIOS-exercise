//
//  MemberDetailViewController.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var personPhoto: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personInfo: UILabel!
    
    let coreMembers:[Person] = TeamMembers().getCoreMembersArray()
    let teachers:[Person] = TeamMembers().getTeachersArray()
    let acGuys:[Person] = TeamMembers().getACGuys()
    var index = 0
    var showArray:[Person] = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        segmentedControl.selectedSegmentIndex = 0
        showArray = coreMembers
        personPhoto.image = UIImage(named: showArray[index].image!)
        personName.text = showArray[index].name
        personInfo.text = showArray[index].info
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func segmentChange(sender: AnyObject) {
        
        switch segmentedControl.selectedSegmentIndex
        
        {
        case 0:
            index = 0
            showArray = coreMembers
            personPhoto.image = UIImage(named: showArray[index].image!)
            personName.text = showArray[index].name
            personInfo.text = showArray[index].info
        case 1:
            index = 0
            showArray = teachers
            personPhoto.image = UIImage(named: showArray[index].image!)
            personName.text = showArray[index].name
            personInfo.text = showArray[index].info
        case 2:
            index = 0
            showArray = acGuys
            personPhoto.image = UIImage(named: showArray[index].image!)
            personName.text = showArray[index].name
            personInfo.text = showArray[index].info
        default:
            break
        }
    }
    @IBAction func previousButton(sender: AnyObject) {
        photoUpdateToPrevious()
    }

    @IBAction func nextButton(sender: AnyObject) {
        pohotoUpdateToNext()
    }
    
    func pohotoUpdateToNext() {
        if index+1 < showArray.count {
            index += 1
            self.personPhoto.image = UIImage(named: showArray[index].image!)
            self.personName.text = showArray[index].name
            self.personInfo.text = showArray[index].info
        }
        else if index+1 == showArray.count {
            index = 0
            self.personPhoto.image = UIImage(named: showArray[index].image!)
            self.personName.text = showArray[index].name
            self.personInfo.text = showArray[index].info
        }
    }
    
    func photoUpdateToPrevious() {
        if index-1  >= 0 {
            index -= 1
            self.personPhoto.image = UIImage(named: showArray[index].image!)
            self.personName.text = showArray[index].name
            self.personInfo.text = showArray[index].info
        }
        else if index-1 < 0 {
            index = showArray.count-1
            self.personPhoto.image = UIImage(named: showArray[index].image!)
            self.personName.text = showArray[index].name
            self.personInfo.text = showArray[index].info
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
