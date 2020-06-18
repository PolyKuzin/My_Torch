//
//  ViewController.swift
//  JustTorch
//
//  Created by Павел Кузин on 10/05/2019.
//  Copyright © 2019 Павел Кузин. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController
{
    override func viewDidLoad()
 {
        super.viewDidLoad()
 }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        sender.contentEdgeInsets = UIEdgeInsets (top: 100, left: 100, bottom: 100, right: 100)

        let device = AVCaptureDevice.default (for: AVMediaType.video)

// Checking the devise has Torch or not
        if device?.hasTorch ?? true
        {
            do {
                try
                    device?.lockForConfiguration()
                    device?.torchMode = device?.torchMode == AVCaptureDevice.TorchMode.on ? .off : .on

                switch device?.torchMode
                {

// Changing the button title from "Torch" to "Torch On" and "Torch OFF" if the Torch is Lighting
                    case AVCaptureDevice.TorchMode.on?:
                        sender.setTitle("Torch ON", for: UIControl.State.normal)
                    case AVCaptureDevice.TorchMode.off?:
                        sender.setTitle("Torch OFF", for: UIControl.State.normal)
                    default:
                        alert()
                }
                    device?.unlockForConfiguration()
                } catch{
                print(error)
                }
        }
// If the device hasn't a Torch button title will change to "Sorry, but your device doesn't has a torch"
        else {
            alert()
        }
    }
    func alert(){
        let alert = UIAlertController(title: "UUUps", message: "Your devise does not have a flash(", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok(", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}
