sub init()
    initItems()
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
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        if key = "up"
            m.back15.setFocus(true)
        else if key = "right" and m.back15.hasFocus()
            m.back15.setFocus(true)
        end if
        return true
    end if
    return false
end function