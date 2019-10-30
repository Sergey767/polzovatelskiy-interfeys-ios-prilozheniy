//
//  MyFriendsViewController.swift
//  Vkontakte
//
//  Created by Серёжа on 24/08/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class MyFriendsViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var myFriends: [User] = [
        User(name: "Гомер", surname: "Симпсон", imageAvatar: "homerSimpson", imagePhoto: "homerSimpson2"),
        User(name: "Мардж", surname: "Симпсон", imageAvatar: "marjSimpson", imagePhoto: "marjSimpson2"),
        User(name: "Барт", surname: "Симпсон", imageAvatar: "bartSimpson", imagePhoto: "bartSimpson2"),
        User(name: "Лиза", surname: "Симпсон", imageAvatar: "LizaSimpson", imagePhoto: "LizaSimpson2"),
        User(name: "Мэгги", surname: "Симпсон", imageAvatar: "meggiSimpson", imagePhoto: "meggiSimpson2")
    ]
    
    var myFriendsDictionary = [String: [User]]()
    var myFriendsSectionTitles = [String]()
    
    var filteredFriends = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        searchBar.delegate = self
        
        filteredFriends = myFriends.sorted { $0.name < $1.name }
        filterTitleFriends()
        tableView.reloadData()
        
    }
    
    // MARK: - Search Bar delegate methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filteredFriends = myFriends.sorted { $0.name < $1.name}
            filterTitleFriends()
            tableView.reloadData()
            return
        }
        filteredFriends = myFriends.filter { $0.name.lowercased().contains(searchText.lowercased())}
        filteredFriends.sort { $0.name < $1.name }
        filterTitleFriends()
        tableView.reloadData()
    }
    
    private func filterTitleFriends() {
        
        myFriendsDictionary = [:]
        myFriendsSectionTitles = []
        
        for friend in filteredFriends {
            let friendKey = String(friend.name.prefix(1))
            if var friendValues = myFriendsDictionary[friendKey] {
                friendValues.append(friend)
                myFriendsDictionary[friendKey] = friendValues
            } else {
                myFriendsDictionary[friendKey] = [friend]
            }
        }
        myFriendsSectionTitles = [String](myFriendsDictionary.keys)
        myFriendsSectionTitles = myFriendsSectionTitles.sorted(by: { $0 < $1 } )
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoSegue",
            let photoController = segue.destination as? PhotoCollectionViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
            let friendKey = myFriendsSectionTitles[indexPath.section]
            if let friendValues = myFriendsDictionary[friendKey] {
                let friendsPhoto = friendValues[indexPath.row].imagePhoto
                let friendTitle = friendValues[indexPath.row].name + " " + friendValues[indexPath.row].surname
                
                photoController.photo = friendsPhoto
                photoController.friendTitle = friendTitle
            }
        
        }
    }
}

    // MARK: - Table view data source, delegate methods

extension MyFriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myFriendsSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendKey = myFriendsSectionTitles[section]
        if let friendValues = myFriendsDictionary[friendKey] {
            return friendValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! MyFriendsCell
        
        let friendKey = myFriendsSectionTitles[indexPath.section]
        if let friendValues = myFriendsDictionary[friendKey] {
        
        cell.friendsName?.text =  friendValues[indexPath.row].name + " " + friendValues[indexPath.row].surname
    
            let friendsPhoto = friendValues[indexPath.row].imageAvatar
                cell.circularAvatarView.imageAvatar.image = UIImage(named: friendsPhoto)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return myFriendsSectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return myFriendsSectionTitles
    }
}





