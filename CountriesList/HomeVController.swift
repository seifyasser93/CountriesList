//
//  HomeVController.swift
//  CountriesList
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit

class HomeVController: UIViewController {

    @IBOutlet weak var welcomeUserLA: UILabel!
    @IBOutlet weak var countriesTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesTV.isHidden = true
        
        loadURL(tableView: countriesTV)
        
        countriesTV.isHidden = false
        
        Firebase.ShowDisplayName(welcomeUserLabel: welcomeUserLA)
    }
    
    @IBAction func logOutBU(_ sender: UIButton) {
        Firebase.SignOut(viewController: self)
    }
}

extension HomeVController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultItemModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        let nameLabel = cell.viewWithTag(1) as! UILabel
        let codeLabel = cell.viewWithTag(2) as! UILabel
        
        nameLabel.text = resultItemModel[indexPath.row].countryName
        codeLabel.text = resultItemModel[indexPath.row].countryCode
        
        return cell
    }
}
