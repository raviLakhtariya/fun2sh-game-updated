//
//  TableGenerateVC.swift
//  FUN2SH
//
//  Created by Janki on 14/06/19.
//  Copyright © 2019 Elluminati. All rights reserved.
//

import UIKit

class TableGenerateVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    var tableArray : [String] = []
    var strEnterNumber : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        for i in 1...10{
            tableArray.append("\(strEnterNumber!) * \(i) = \(Int(strEnterNumber)! * i)")
        }
        if tableArray.count == 10 {
            tableView.reloadData()
        }
    }
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : tableCell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! tableCell
        cell.ghadiyo.text = tableArray[indexPath.row]
        return cell
    }
}
