//
//  ProfileViewController.swift
//  Tinder Demo
//
//  Created by Jiapei Liang on 4/6/17.
//  Copyright © 2017 Jiapei Liang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var profileImage: UIImage!
    var bParent: CardsViewController!
    @IBOutlet weak var tabBar: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImageView.image = profileImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapNavBar(_ sender: UITapGestureRecognizer) {
        print("Tapping")
        dismiss(animated: true, completion: nil)
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
