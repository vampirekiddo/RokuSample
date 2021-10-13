sub init()
    initGetNodes()
    m.btnGroup.setFocus(true)
    initObservers()
end sub

sub initGetNodes()
    m.btnGroup = m.top.findNode("btnGroup")
    m.start = m.btnGroup.findNode("start")
    m.stop = m.btnGroup.findNode("stop")
    m.reset = m.btnGroup.findNode("reset")
    m.timer = m.top.findNode("timer")
    m.timeLabel = m.top.findNode("timeLabel")
end sub

sub initObservers()
    m.start.observeField("buttonSelected", "start")
    m.stop.observeField("buttonSelected", "stop")
    m.reset.observeField("buttonSelected", "reset")
end sub

sub start()
    m.timer.control = "start"
end sub

sub stop()
    m.timer.control = "stop"
end sub
