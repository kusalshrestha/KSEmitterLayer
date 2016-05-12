# KSEmitterLayer
Emitter layer using CoreAnimation using Swift

## Example
```sh
        let emitterLayer = KSParticleLayer()
        emitterPlayView.layer.addSublayer(emitterLayer)
        emitterLayer.particleVelocity = CGFloat(200)
        emitterLayer.birthRate = 100
        emitterLayer.startEmittingWithEffect(.Blast, andPosition: view.center)
```

