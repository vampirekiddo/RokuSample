sub init()
    initItems()
    initObservers()
    m.back15.setfocus(true)
end sub

sub initItems()
    m.mainParent = m.top.findNode("mainParent")
    m.elapsedTime = m.mainParent.findNode("elapsedTime")
    m.ScrubberFilled = m.mainParent.findNode("ScrubberFilled")
    m.ScrubberContainer = m.mainParent.findNode("ScrubberContainer")
    m.remainingTime = m.mainParent.findNode("remainingTime")
    m.bottomButtons = m.top.findNode("bottomButtons")
    m.back15 = m.bottomButtons.findNode("back15")
    m.playPause = m.bottomButtons.findNode("playPause")
    m.forward15 = m.bottomButtons.findNode("forward15")
    m.CC = m.bottomButtons.findNode("CC")
    m.forward15.removeChildIndex(2)
    m.playPause.removeChildIndex(2)
    m.CC.removeChildIndex(2)
    m.forward15.height = 96
    m.back15.height = 96
    m.playPause.height = 96
    m.CC.height = 96
    ?m.forward15.getChildren(5, 0)
end sub

sub initObservers()
    m.playPause.observeField("buttonSelected", "fireEvent")
    m.back15.observeField("buttonSelected", "fireEvent")
    m.forward15.observeField("buttonSelected", "fireEvent")
    m.CC.observeField("buttonSelected", "fireEvent")
end sub

sub fireEvent(event)
    if event.getNode() = "playPause"
        m.top.navigationEvents.status = not m.top.navigationEvents.status
    end if
end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        if key = "right" and m.back15.hasFocus()
            m.playPause.setFocus(true)
            return true
        else if key = "right" and m.playPause.hasFocus()
            m.forward15.setFocus(true)
            return true
        else if key = "right" and m.forward15.hasFocus()
            m.CC.setFocus(true)
            return true
        else if key = "right" and m.CC.hasFocus()
            return false
        else if key = "left" and m.CC.hasFocus()
            m.forward15.setFocus(true)
            return true
        else if key = "left" and m.forward15.hasFocus()
            m.playPause.setFocus(true)
            return true
        else if key = "left" and m.playPause.hasFocus()
            m.back15.setFocus(true)
            return true
        else if key = "left" and m.back15.hasFocus()
            return false
        else if key = "up" and m.top.opacity = 0
            m.top.opacity = 1
            m.back15.setFocus(true)
            return true
        else if key = "down" and m.top.opacity = 1
            m.top.opacity = 0
            return true
        end if
    end if
    return false
end function