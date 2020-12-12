//
//  GameViewController.swift
//  Accelerometer
//
//  Created by 青木蓮 on 2020/12/12.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var awaImageView: UIImageView!
    let motionManger = CMMotionManager()
    var accelerationX:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if motionManger.isAccelerometerAvailable {
            motionManger.accelerometerUpdateInterval = 0.01
            motionManger.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
                
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                
                if self.awaImageView.frame.origin.x < 40 {
                    self.awaImageView.frame.origin.x = 40
                }
                
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
