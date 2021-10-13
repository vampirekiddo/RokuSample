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
    m.timeLabel.text = Str(INT(time / 60)) + ":" + Str((INT((time)))
end sub

sub reset()
    m.timer = createObject("roTimeSpan")
end sub