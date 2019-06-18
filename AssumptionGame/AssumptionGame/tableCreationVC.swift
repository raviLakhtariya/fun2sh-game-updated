//
//  tableCreationVC.swift
//  FUN2SH
//
//  Created by Janki on 14/06/19.
//  Copyright © 2019 Elluminati. All rights reserved.
//

import UIKit

class tableCreationVC: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtNumberField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNavigationBtn(_ sender: Any) {
        let tableGenrationObj : TableGenerateVC = self.storyboard?.instantiateViewController(withIdentifier: "tableGenerate") as! TableGenerateVC
        tableGenrationObj.strEnterNumber = txtNumberField.text;
        self.navigationController?.pushViewController(tableGenrationObj, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
