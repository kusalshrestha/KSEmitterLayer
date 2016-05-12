//
//  ViewController.swift
//  CAEmitterDemo
//
//  Created by Kusal Shrestha on 5/10/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import UIKit
import KSCAEmitter

class ViewController: UIViewController {

    var emitterLayer: KSParticleLayer!
    @IBOutlet var emitterPlayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emitterLayer = KSParticleLayer()
        emitterPlayView.layer.addSublayer(emitterLayer)
        
        emitterLayer.startEmittingWithEffect(.Blast, andPosition: view.center)
    }

    @IBAction func VelocityChanged(sender: UISlider) {
        emitterLayer.particleVelocity = CGFloat(sender.value)
    }
    
    @IBAction func DensityChanged(sender: UISlider) {
        emitterLayer.birthRate = sender.value
    }
    
    @IBAction func emissionTypeSelection(sender: UISegmentedControl) {
        emitterLayer.emissionType = ParticleEffect(rawValue: sender.selectedSegmentIndex)!
    }
    
}
