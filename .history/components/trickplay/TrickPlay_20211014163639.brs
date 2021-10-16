sub init()
    initItems()
    initObservers()
end sub

sub initItems()
    m.main = m.top.findNode("main")
    m.mainParent = m.main.findNode("mainParent")
    m.elapsedTime = m.mainParent.findNode("elapsedTime")
    m.ScrubberFilled = m.mainParent.findNode("ScrubberFilled")
    m.LoadingGroup = m.top.findNode("LoadingGroup")
    m.loadingFilled = m.LoadingGroup.findNode("loadingFilled")
    m.loadingPercent = m.LoadingGroup.findNode("loadingPercent")
    m.totalTime = m.mainParent.findNode("totalTime")
    m.bottomButtons = m.top.findNode("bottomButtons")
    m.back15 = m.bottomButtons.findNode("back15")
    m.playPause = m.bottomButtons.findNode("playPause")
    m.forward15 = m.bottomButtons.findNode("forward15")
    m.CC = m.bottomButtons.findNode("CC")
    m.UIShow = m.main.findNode("UIShow")
    m.UIHide = m.main.findNode("UIHide")
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
    m.top.observeField("position", "updatePosition")
    m.top.observeField("loadingPosition", "updateLoading")
    ' m.top.observeField("loading", "showLoading")
    m.LoadingGroup.visible = false
    ' m.loadingRatio = 100 / m.top.loadingPosition
end sub

sub updateDuration()
    m.totalTime.text = handleTimeDisplay(m.top.duration)
    m.fillingRatio = 700 / m.top.duration
end sub

' sub showLoading()

'     m.LoadingGroup.visible = not m.LoadingGroup.visible
' end sub

sub updateLoading()
    m.back15.setFocus(true)
    m.LoadingGroup.visible = true
    m.loadingPercent.text = m.top.loadingPosition.toStr() + "%"
    m.loadingFilled.width = INT(m.top.loadingPosition * 1.5)
    if m.top.loadingPosition = 100
        m.LoadingGroup.visible = false
    end if
end sub

sub updatePosition()
    m.ScrubberFilled.width = INT(m.top.position * m.fillingRatio)
    m.elapsedTime.text = handleTimeDisplay(m.top.position)
end sub

sub handleTimeDisplay(time as Integer) as String
    minutes = INT(time / 60)
    seconds = INT(time MOD 60)
    ' Logic for handling zero padding
    minutesStr = ""
    secondsStr = ""
    if minutes < 10
        minutesStr += "0"
    end if
    if seconds < 10
        secondsStr += "0"
    end if
    return minutesStr + minutes.toStr() + ":" + secondsStr + seconds.toStr()
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

sub showNav()
    if m.main.opacity = 0

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
    showNav()
    return false
end function