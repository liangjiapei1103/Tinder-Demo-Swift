//
//  CardsViewController.swift
//  Tinder Demo
//
//  Created by Jiapei Liang on 4/6/17.
//  Copyright © 2017 Jiapei Liang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    var rotationDirection: CGFloat!
    var imageTransition: ImageTransition!
    
    @IBOutlet weak var cardImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapCard(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "moreImagesSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreImagesSegue" {
            let destinationVC = segue.destination as! ProfileViewController
            destinationVC.profileImage = cardImageView.image
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.custom
            imageTransition = ImageTransition()
            destinationVC.transitioningDelegate = imageTransition
            imageTransition.duration = 0.3
        }
    }
    
    @IBAction func onDragCard(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        let location = sender.location(in: view)
        
        if sender.state == .began {
            print("Begin Dragging")
            cardInitialCenter = cardImageView.center
            
            if location.y > cardInitialCenter.y {
                rotationDirection = -1
            } else {
                rotationDirection = 1
            }
            
        } else if sender.state == .changed {
            print("Dragging")
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
    
            cardImageView.transform = cardImageView.transform.rotated(by: rotationDirection * velocity.x * CGFloat.pi / 18000)
        } else if sender.state == .ended {
            print("End Dragging")
            if translation.x > 50.0 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.center.x += self.cardImageView.frame.width
                })
            } else if translation.x < -50.0 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.center.x -= self.cardImageView.frame.width
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.transform = CGAffineTransform.identity
                    self.cardImageView.center = self.cardInitialCenter
                })
            }
        }
        
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
