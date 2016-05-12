# KSEmitterLayer
Emitter layer using CoreAnimation using Swift

## How to import the framework
First import the framework into the project
Add it to the "Embedded Binaries" and you are good to go. :)

![alt tag](https://github.com/shrsthakusal/KSEmitterLayer/blob/master/Screen%20Shot%202016-05-12%20at%202.32.27%20PM.png)

## Example
```sh
let emitterLayer = KSParticleLayer()
emitterPlayView.layer.addSublayer(emitterLayer)
emitterLayer.particleVelocity = CGFloat(200)
emitterLayer.birthRate = 100
emitterLayer.startEmittingWithEffect(.Blast, andPosition: view.center)
```
## ScreenShot
![alt tag](https://github.com/shrsthakusal/KSEmitterLayer/blob/master/KSEmitterLayer.gif)
