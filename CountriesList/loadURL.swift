//
//  loadURL.swift
//  CountriesList
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit

var resultItemModel = [ResultModel]()

func loadURL(tableView : UITableView) {
    do {
        let url = "https://api.printful.com/countries"
        let appURL = URL(string: url)!
        let data = try Data(contentsOf: appURL)
        
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            else {
                print("Error to parse json")
                return
        }
        guard let result = json["result"] as? [[String : Any]]
            else {
                print("Error to parse result")
                return
        }
        
        for resultModelItem in result {
            let code = resultModelItem["code"] as! String
            let name = resultModelItem["name"] as! String
            
            resultItemModel.append(ResultModel(countryName: name, countryCode: code))
        }
        
        tableView.reloadData()
        
    }
    catch {
        print("Url Session Error")
    }

}

struct ResultModel {
    var countryName : String
    var countryCode : String
}
