//
//  NewsViewController.swift
//  Vkontakte
//
//  Created by Серёжа on 08/09/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var myGroups: [Group] = [
        Group(nameGroup: "Apple", subscribers: 160000, siteGroup: "www.Apple.com", dateOfCreation: "23.04.2008", numberOfRecords: 34567, photo: "apple")
    ]
    
    var inscription = "Мы привыкли к тому, что на iPhone фирменный значок яблока располагается ближе к верхней части задней панели. Есть вероятность, что внешний вид новых моделей, которые нам покажут уже через два дня, сломает этот шаблон. \n Информацией поделился сотрудник издания Bloomberg. По его словам, логотип Apple на задней панели iPhone модельного ряда 2019 года будет располагаться ровно по центру. Причём не просто прихоти ради. \n Как выяснилось, iPhone должны получить беспроводную зарядку, и не простую, а обратную. Это значит, что смартфоном можно будет подзаряжать, например, Apple Watch. И чтобы пользователи знали, куда именно класть девайсы, компания поменяла расположение значка (класть надо прямо на него)."
    
    var imageNews = "Iphone 11"
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }
}

    // MARK: - Table view data source

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupNewsCell", for: indexPath) as! GroupNewsCell
            
            cell.nameLabel.text = myGroups[indexPath.row].nameGroup
            
            cell.friendImage.image = UIImage(named: myGroups[indexPath.row].photo)
        
            cell.friendImage.layer.cornerRadius = cell.friendImage.frame.size.width / 2
            cell.friendImage.clipsToBounds = true
        
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextNewsCell", for: indexPath) as! TextNewsCell
            
            cell.inscriptionLabel.text = inscription
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNewsCell", for: indexPath) as!
                ImageNewsCell
            
            cell.imageNews.image = UIImage(named: imageNews)
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonsCell", for: indexPath) as!
                ButtonsCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingIndicatorCell", for: indexPath) as!
            LoadingIndicatorCell
            
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: .repeat, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                    cell.self.loadingIndicatorView.loadingIndicatorOne.alpha = 0
                }
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
                    cell.self.loadingIndicatorView.loadingIndicatorTwo.alpha = 0
                }
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.6) {
                    cell.self.loadingIndicatorView.loadingIndicatorThree.alpha = 0
                }
            }, completion: nil)
            
            return cell
        }
            
    }
}




    

