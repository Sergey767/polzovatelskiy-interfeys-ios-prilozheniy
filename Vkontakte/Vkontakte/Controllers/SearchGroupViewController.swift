//
//  SearchGroupViewController.swift
//  Vkontakte
//
//  Created by Серёжа on 29/06/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class SearchGroupViewController: UITableViewController {
    
    var myGroups: [Group] = [
        Group(nameGroup: "GeekBrains", subscribers: 345897, siteGroup: "www.geekbrains.ru", dateOfCreation: "15.01.2010", numberOfRecords: 568987, photo: "geekbrains") ,
        Group(nameGroup: "Automobili", subscribers: 5908788, siteGroup: "www.Autovk.com", dateOfCreation: "03.02.2011", numberOfRecords: 3009872, photo: "auotomobili") ,
        Group(nameGroup: "Спорт", subscribers: 4034590, siteGroup: "www.VKsport.com", dateOfCreation: "11.09.2014", numberOfRecords: 34567, photo: "sport") ,
        Group(nameGroup: "Aliexpress", subscribers: 6050453, siteGroup: "www.Aliexpress.com", dateOfCreation: "23.04.2008", numberOfRecords: 34567, photo: "aliexpress") ,
        Group(nameGroup: "НОвостиRU", subscribers: 489112, siteGroup: "www.newsru.ru", dateOfCreation: "21.03.2009", numberOfRecords: 1985004, photo: "novosti") ,
        Group(nameGroup: "Gulliver", subscribers: 509456, siteGroup: "www.gulliver.ru", dateOfCreation: "10.10.2016", numberOfRecords: 109567, photo: "gulliver")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchGroupCell", for: indexPath) as! SearchGroupCell
        
        cell.searchGroupName.text = myGroups[indexPath.row].nameGroup
        cell.searchGroupImageView.image = UIImage(named: myGroups[indexPath.row].photo)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
