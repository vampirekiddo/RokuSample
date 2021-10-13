sub init()
    initGetNodes()
    m.btnGroup.setFocus(true)
    initObservers()
end sub

sub initGetNodes()
    m.btnGroup = m.top.findNode("btnGroup")
    m.start = m.btnGroup.findNode("start")
    m.stopTimer = m.btnGroup.findNode("stopTimer")
    m.reset = m.btnGroup.findNode("reset")
    ' m.timer = m.top.findNode("timer")
    m.timeLabel = m.top.findNode("timeLabel")
end sub

sub initObservers()
    m.start.observeField("buttonSelected", "start")
    m.stopTimer.observeField("buttonSelected", "stopTimer")
    m.reset.observeField("buttonSelected", "reset")
    m.timer = createObject("roTimespan")
    ' m.timer.observeField("fire", "changeText")
end sub

sub start()
    m.timeLabel.text = "00:00"
    m.timer.Mark()
end sub

sub stopTimer()
    time = m.timer.TotalSeconds()
    if time MOD 60 = 0
        seconds = "00"
        minutes = Str(time / 60)
    else
        minutes = INT(time / 60)
        seconds = INT(time MOD 60)
        if minutes < 10
            minutes = "0" + Str(minutes)
        else
            minutes = Str(time / 60)
        end if
        if seconds < 10
            seconds = "0" + Str(seconds)
        else
            seconds = Str(time / 60)
        end if
    end if
    m.timeLabel.text = minutes + ":" + seconds
end sub

sub reset()
    m.timer = createObject("roTimeSpan")
end sub