sub init()
    m.top.functionname = "createScreen"
end sub

sub createScreen()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("itemDetailsScreen")
    scene.content = m.top.content
    scene.backgroundUri = m.top.content.HDPosterURL
    screen.show()
    scene.setFocus(true)
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub