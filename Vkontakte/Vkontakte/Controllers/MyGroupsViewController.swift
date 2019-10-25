//
//  MyGroupsViewController.swift
//  Vkontakte
//
//  Created by Серёжа on 29/06/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    
    var myGroups: [Group] = [
        Group(nameGroup: "Apple", subscribers: 160000, siteGroup: "www.Apple.com", dateOfCreation: "23.04.2008", numberOfRecords: 34567, photo: "apple") ,
        Group(nameGroup: "Football", subscribers: 1456843, siteGroup: "www.Football.ru", dateOfCreation: "04.12.2001", numberOfRecords: 967234, photo: "football") ,
        Group(nameGroup: "NBA", subscribers: 3234812, siteGroup: "www.NBA.com", dateOfCreation: "06.01.2015", numberOfRecords: 1856732, photo: "nba") ,
        Group(nameGroup: "MusicVK", subscribers: 434732, siteGroup: "www.MusicVkontakte.ru", dateOfCreation: "16.08.2019", numberOfRecords: 236845, photo: "music vk") ,
        Group(nameGroup: "NR", subscribers: 2456459, siteGroup: "www.NewREp.com", dateOfCreation: "25.02.2017", numberOfRecords: 987345, photo: "NR") ,
        Group(nameGroup: "Лайфхаки", subscribers: 576210, siteGroup: "www.vklifeh.com", dateOfCreation: "13.04.2012", numberOfRecords: 390450, photo: "layfhaki")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

    }
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as! MyGroupsCell
            
            cell.groupsName.text = myGroups[indexPath.row].nameGroup
            cell.myGroupsImageView.image = UIImage(named: myGroups[indexPath.row].photo)
            
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! MyGroupsCell
        
         let animation = CASpringAnimation(keyPath: "transform.scale")
                      animation.fromValue = 0
                      animation.toValue = 0.5
                      animation.duration = 0.3
                      animation.damping = 0.5
                      animation.initialVelocity = 0
                      animation.stiffness = 200
                      animation.mass = 2
                      animation.fillMode = CAMediaTimingFillMode.backwards
                      animation.isRemovedOnCompletion = false
                    cell.myGroupsImageView.layer.add(animation, forKey: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
            if let controller = segue.source as? SearchGroupViewController,
                let indexPath = controller.tableView.indexPathForSelectedRow {
                let group = controller.myGroups[indexPath.row]
                
                guard !myGroups.contains(where: { $0.nameGroup == group.nameGroup } ) else {return}
                
                myGroups.append(group)
                let newIndexPath = IndexPath(item: myGroups.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
    }
    
}
