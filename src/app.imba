import { Triangle } from './triangle'

var start = Date.new.getTime

tag App
    def build
        @dots = 1000
        @seconds = 0
        @scale = 1
        @scaleX = 2.1
        @scaleY = 0.7
        @t = 0

    def mount
        schedule(raf: true)

    def unmount
        unschedule

    def tick
        var elapsed = Date.new.getTime - start
        @t = (elapsed / 1000) % 10
        @seconds = Math.round @t < 0.5 && @seconds !== 0 ? 10 : Math.round @t
        @scale = @dots / 1000
        @scaleX = (1 + (@t > 5 ? 10 - @t : @t) / 10) / (2.1 * @scale)
        @scaleY = 0.7 / @scale
        render

    def increase
        @dots *= 2

    def decrease
        @dots === 125 ? @dots = @dots : @dots *= 0.5

    def render
        <self>
            <p> "See other demos: "
                <a href="https://stencil-fiber-demo.firebaseapp.com/perf.html"> "Stencil"
                <a href="https://claudiopro.github.io/react-fiber-vs-stack-demo/fiber.html"> "React Fiber"
                <a href="https://mupkoo.github.io/react-fiber-demo-with-glimmerjs/"> "React Fiber with Glimmer"
            <p> "Number of dots: "
                <strong> "{@dots}"
            <button :click.increase> "Increase Dots"
            <button :click.decrease> "Decrease Dots"
            <div.container style="transform: scaleX({@scaleX}) scaleY({@scaleY}) translateZ(0.1px)">
                <Triangle[{ x: 0, y: 0, s: @dots, seconds: @seconds }]>

Imba.mount <App>