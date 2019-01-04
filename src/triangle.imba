import { Dot } from './dot'

export tag Triangle
    def build
        @targetSize = 25

    def showDot
        return data:s <= @targetSize

    def nextS
        return data:s / 2

    def render
        var s = this.nextS
        <self>
            if this.showDot
                <Dot[{ x: data:x - (@targetSize / 2), y: data:y - (@targetSize / 2), size: @targetSize, text: data:seconds }]>
            else
                <Triangle[{ x: data:x, y: data:y - (s / 2),s: s, seconds: data:seconds }]>
                <Triangle[{ x: data:x - s, y: data:y + (s / 2),s: s, seconds: data:seconds }]>
                <Triangle[{ x: data:x + s, y: data:y + (s / 2),s: s, seconds: data:seconds }]>
