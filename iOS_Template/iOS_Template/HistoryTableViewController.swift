//
//  HistoryTableViewController.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/17/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryTableViewController: UITableViewController{
    var weatherSearchs:[SearchWeatherRealm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(newWeatherSearch), name: NSNotification.Name("WeatherSearchNotification"), object: nil)
        
        do {
            let realm = try Realm()
            weatherSearchs = Array<SearchWeatherRealm>(realm.objects(SearchWeatherRealm.self))
        } catch {
            
        }
    }
    
    @objc func newWeatherSearch(notification:Notification) {
        let userInfo = notification.userInfo
        let newSearchWeatherRealm = userInfo!["currentWeather"] as! SearchWeatherRealm
        weatherSearchs += [newSearchWeatherRealm]
        tableView.insertRows(at: [IndexPath(row: weatherSearchs.count - 1, section: 1)], with: .automatic)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherSearchs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)

        cell.textLabel?.text = weatherSearchs[indexPath.row].description
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
