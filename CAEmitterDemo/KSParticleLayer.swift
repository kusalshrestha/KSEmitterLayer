//
//  KSParticleLayer.swift
//  CAEmitterDemo
//
//  Created by Kusal Shrestha on 5/11/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import UIKit

public enum ParticleEffect: Int {
    case Blast, ProjectileVertical, ProjectileLeft, ProjectileRight
    
    public var emissionValue: CGFloat {
        switch self {
        case .Blast:
            return CGFloat(M_PI)
        case .ProjectileVertical:
            return CGFloat(-M_PI / 2)
        case .ProjectileLeft:
            return CGFloat(0)
        case .ProjectileRight:
            return CGFloat(M_PI)
        }
    }
    
}

public class KSParticleLayer: CAEmitterLayer {
    
    public var particleVelocity: CGFloat = 10 {
        didSet {
            self.setValue(particleVelocity, forKeyPath: "emitterCells.confetti.velocity")
        }
    }
    
    public var particleImage: CGImage! {
        didSet {
            self.setValue(particleImage, forKeyPath: "emitterCells.confetti.contents")
        }
    }
    
    public var emissionType: ParticleEffect = .Blast {
        didSet {
            switch emissionType {
            case .Blast:
                self.setValue(emissionType.emissionValue, forKeyPath: "emitterCells.confetti.emissionRange")

            case .ProjectileLeft, .ProjectileRight, .ProjectileVertical:
                self.setValue(emissionType.emissionValue, forKeyPath: "emitterCells.confetti.emissionLongitude")
                self.setValue(CGFloat(M_PI / 10), forKeyPath: "emitterCells.confetti.emissionRange")
                self.setValue(200, forKeyPath: "emitterCells.confetti.yAcceleration")
            }
        }
    }
    
    public override init() {
        super.init()

        commonInit()
    }
    
    public override init(layer: AnyObject) {
        super.init(layer: layer)
        
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        createEmitterLayer()
    }
    
    private func createEmitterLayer() {
        self.emitterShape = kCAEmitterLayerRectangle
        self.emitterSize = CGSize(width: 10, height: 10)
        self.renderMode = kCAEmitterLayerUnordered
        self.emitterMode = kCAEmitterLayerAdditive
    }
    
    private func createEmitterCellsWithColor(color: UIColor) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.birthRate = 0
        emitterCell.lifetime = 4
        emitterCell.lifetimeRange = 1
        emitterCell.contents = UIImage(named: "confetti.png")?.CGImage
        emitterCell.name = "confetti"
        
        //colors
        emitterCell.redRange = 1
        emitterCell.blueRange = 1
        emitterCell.greenRange = 1
        
        //velocity
        emitterCell.velocity = particleVelocity
        emitterCell.velocityRange = CGFloat(particleVelocity / 10)
        
        //Alpha
        emitterCell.alphaSpeed = 4.5
        emitterCell.alphaRange = 0.5
        
        //Scale
        emitterCell.scale = 0.5
        emitterCell.scaleRange = 0.5
        emitterCell.scaleSpeed = 0.1
        
        //spin
        emitterCell.spin = CGFloat(M_PI)
        emitterCell.spinRange = CGFloat(M_PI/2)
        
        return emitterCell
    }
    
    public func startEmittingWithEffect(effect: ParticleEffect, andPosition position: CGPoint) {
        self.position = position
        
        let cell = createEmitterCellsWithColor(UIColor.blueColor())
        cell.birthRate = 20
        self.emitterCells = [cell]

        switch effect {
        case .Blast:
            cell.emissionRange = effect.emissionValue
            
        case .ProjectileLeft, .ProjectileVertical, .ProjectileRight:
            cell.emissionLongitude = effect.emissionValue
            cell.emissionRange = CGFloat(M_PI / 10)
            cell.yAcceleration = 200

        }
    }
    
}
