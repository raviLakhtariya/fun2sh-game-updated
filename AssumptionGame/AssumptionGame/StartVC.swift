//
//  StartVC.swift
//  FUN2SH
//
//  Created by Janki on 14/06/19.
//  Copyright © 2019 Elluminati. All rights reserved.
//

import UIKit

class StartVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topview: UIView!
    var arrayValue : [String] = ["Fun2sh","Table Creation","Terms & Conditions","Send Mail"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayValue.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let startCellObj : startCell = collectionView.dequeueReusableCell(withReuseIdentifier: "startcel", for: indexPath) as! startCell
        
        startCellObj.cellLbl.text = arrayValue[indexPath.row]
        
        return startCellObj
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let fun2ShObj : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "funStart") as! ViewController
            self.navigationController?.pushViewController(fun2ShObj, animated: true)
            
        }else if indexPath.row == 1{
            let tbleCreationObj : tableCreationVC = self.storyboard?.instantiateViewController(withIdentifier: "tableCreation") as! tableCreationVC
            self.navigationController?.pushViewController(tbleCreationObj, animated: true)
            
        }else if indexPath.row == 2 {
            let fun2ShObj : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "funStart") as! ViewController
            self.navigationController?.pushViewController(fun2ShObj, animated: true)
            
        }else if indexPath.row == 3{
            let termsObj : TermsVC = self.storyboard?.instantiateViewController(withIdentifier: "terms") as! TermsVC
            self.navigationController?.pushViewController(termsObj, animated: true)
            
        }else{
            let sendObj : SendMailVC = self.storyboard?.instantiateViewController(withIdentifier: "terms") as! SendMailVC
            self.navigationController?.pushViewController(sendObj, animated: true)
        }
        
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
