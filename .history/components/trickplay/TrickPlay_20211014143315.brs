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
    m.totalTime = m.mainParent.findNode("totalTime")
    m.bottomButtons = m.top.findNode("bottomButtons")
    m.back15 = m.bottomButtons.findNode("back15")
    m.playPause = m.bottomButtons.findNode("playPause")
    m.forward15 = m.bottomButtons.findNode("forward15")
    m.CC = m.bottomButtons.findNode("CC")
    m.forward15.height = 96
    m.back15.height = 96
    m.playPause.height = 96
    m.CC.height = 96
end sub

sub initObservers()
    m.playPause.observeField("buttonSelected", "fireEvent")
    m.back15.observeField("buttonSelected", "fireEvent")
    m.forward15.observeField("buttonSelected", "fireEvent")
    m.CC.observeField("buttonSelected", "fireEvent")
    m.top.observeField("duration", "updateDuration")
end sub

sub updateDuration()
    minutes = INT(m.top.duration / 60)
    seconds = INT(m.top.duration MOD 10)
    if minutes < 10

    end if
end sub

sub fireEvent(event)
    if event.getNode() = "playPause"
        m.top.play = not m.top.play
    else if event.getNode() = "back15"
        m.top.back = not m.top.back
    else if event.getNode() = "forward15"
        m.top.forward = not m.top.forward
    else if event.getNode() = "CC"
        m.top.CC = not m.top.CC
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