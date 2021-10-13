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
end sub

sub initObservers()
    m.start.observeField("buttonSelected", "start")
end sub
