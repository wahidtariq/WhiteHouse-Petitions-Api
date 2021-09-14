//
//  ViewController.swift
//  project7
//
//  Created by wahid tariq on 13/09/21.
//

import UIKit

class ViewController: UITableViewController {
var petitions = [Petition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0{
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        }else{
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                
            }
        }
        
    }
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13.0)
        cell.textLabel?.text = petitions[indexPath.row].title
        cell.detailTextLabel?.text = petitions[indexPath.row].body
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

