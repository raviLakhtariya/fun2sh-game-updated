//
//  TermsVC.swift
//  FUN2SH
//
//  Created by Janki on 14/06/19.
//  Copyright © 2019 Elluminati. All rights reserved.
//

import UIKit

class TermsVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //first we will create a NSURL with the url that we want to load in the webview
        
        let url = NSURL (string: Webservice.term_condition_URL);
        let request = NSURLRequest(url: url! as URL);
        webView.loadRequest(request as URLRequest);
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
