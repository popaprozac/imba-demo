export tag Dot
    def build
        @hover = false

    def hover
        @hover = true

    def leave
        @hover = false

    def render
        var size = data:size * 1.3
        <self :mouseenter.hover :mouseleave.leave>
            <div style="
                position: absolute;
                font: normal 15px sans-serif;
                text-align: center;
                cursor: pointer;
                width: {size}px;
                height: {size}px;
                left: {data:x}px;
                top: {data:y}px;
                border-radius: {size / 2}px;
                line-height: {size}px;
                background: {@hover ? '#ff0' : '#61dafb'};
            "> "{@hover ? '**' + data:text + '**' : data:text}"