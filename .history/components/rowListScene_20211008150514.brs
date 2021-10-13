sub init()
    initGetNodes()
end sub

sub initGetNodes()
    m.start = m.top.findNode("start")
    m.stop = m.top.findNode("stop")
    m.reset = m.top.findNode("reset")
end sub
