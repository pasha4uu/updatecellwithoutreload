//
//  ViewController.swift
//  UpdateTableViewWithoutReload
//
//  Created by PASHA on 16/07/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var myTBV: UITableView!
    
    
    var arrData = [String]()
    
    var index = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.myTBV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        arrData = ["A","B","C","D","E","F","G","H","I","J"];
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func updateCell(_ sender: Any) {
        
        let cell = myTBV.cellForRow(at: index)
        
        cell?.textLabel?.text = nameTF.text
        
    }
    @IBAction func updateTap(_ sender: Any) {
        
        let cell = myTBV.cellForRow(at: index)
        
        cell?.textLabel?.text = nameTF.text
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier:"cell")
        
        if cell != nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = arrData[indexPath.row]
        
        return cell!
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath
        self.nameTF.text = arrData[indexPath.row]
        
        
    }
    
    
    
}
