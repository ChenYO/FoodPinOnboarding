//
//  TabBarView.swift
//  FoodPin
//
//  Created by 陳仲堯 on 2018/9/19.
//  Copyright © 2018年 AppCoda. All rights reserved.
//

import UIKit

class TabBarView: UITabBarController {

    @IBOutlet weak var tabBarCustom: UITabBar!
    
    override func viewWillLayoutSubviews() {
        var tabFrame: CGRect = self.tabBarCustom.frame
        tabFrame.size.height = 80
        tabFrame.origin.y = self.view.frame.size.height - 80
        
        self.tabBarCustom.frame = tabFrame
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
