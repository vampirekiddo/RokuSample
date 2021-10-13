sub init()
    initGetNodes()
end sub

sub initGetNodes()
    m.start = m.top.findNode("start")
    m.start = m.top.findNode("stop")
    m.start = m.top.findNode("reset")
end sub
