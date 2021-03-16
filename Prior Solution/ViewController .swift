//
//  ViewController.swift
//  Prior Solution
//
//  Created by มิตรภาพ สกุลพิสุทธิ์ on 15/3/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tblData: UITableView!
    let data = Data() 
    override func viewDidLoad() {
        super.viewDidLoad()
        tblData.delegate = self
        tblData.dataSource = self
        let url = "https://rickandmortyapi.com/api/character"
        data.getData(from: url)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(data.Result.count != data.count){
            tableView.reloadData()
        }
        return data.Result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId",for: indexPath)
        cell.textLabel?.text = data.Result[indexPath.row]?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailVC {
            destination.Result = data.Result[(tblData.indexPathForSelectedRow?.row)!]
            tblData.deselectRow(at: tblData.indexPathForSelectedRow!, animated: true)
        }
    }
        
}
