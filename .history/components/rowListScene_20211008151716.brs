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
    m.timer = m.top.findNode("timer")
    m.timeLabel = m.top.findNode("timeLabel")
end sub

sub initObservers()
    m.start.observeField("buttonSelected", "start")
    m.stopTimer.observeField("buttonSelected", "stopTimer")
    m.reset.observeField("buttonSelected", "reset")
    m.timer.observeField("fire", "changeText")
end sub

sub changeText()
    m.timeLabel.text = Str(m.timer.duration)
end sub

sub start()
    m.timer.control = "start"
    ?m.timer.duration
end sub

sub stopTimer()
    m.timer.control = "stop"
end sub

sub reset()
    m.timer.control = "reset"
end sub