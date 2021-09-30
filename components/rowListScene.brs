sub init()
    m.global.addField("http", "node", FALSE)
    m.global.addField("ratio", "float", FALSE)
    m.global.http = createObject("roSGNode", "httpTask")
    m.global.http.control = "RUN"
    m.global.ratio = 1
    m.rowList1 = m.top.findNode("rowList1")
    m.rowList2 = m.top.findNode("rowList2")
    m.rowList3 = m.top.findNode("rowList3")
    m.rowList4 = m.top.findNode("rowList4")
    m.rowList5 = m.top.findNode("rowList5")
    m.rowList6 = m.top.findNode("rowList6")
    m.parent = m.top.findNode("rowListParty")
    m.scrollAnimation = m.top.findNode("scroll")
    m.rowList1.content = createObject("roSGNode", "RowListContent")
    m.rowList2.content = createObject("roSGNode", "RowListContent")
    m.rowList3.content = createObject("roSGNode", "RowListContent")
    m.rowList4.content = createObject("roSGNode", "RowListContent")
    m.rowList5.content = createObject("roSGNode", "RowListContent")
    m.rowList6.content = createObject("roSGNode", "RowListContent")
    m.rowFocused = 0
    m.rowList1.setFocus(true)
    videoMode = createObject("roDeviceInfo")
    if videoMode.GetVideoMode() = "720p"
        m.global.ratio = 0.66
    end if
    if m.global.ratio = 0.66
        m.rowList.rowHeights = [Cdbl(m.rowList.rowHeights[0] * m.global.ratio) + 10]
        m.rowList.rowItemSpacing = [[5, 0]]
        m.rowList.focusXOffset = [Cdbl(m.rowList.focusXOffset[0] * m.global.ratio) - 50]
        m.rowList.rowItemSize = [[INT(m.rowList.rowItemSize[0][0] * m.global.ratio) + 20, INT(m.rowList.rowItemSize[0][1] * m.global.ratio)]]
        m.rowList.translation = [INT(m.rowList.translation[0] * m.global.ratio), INT(m.rowList.translation[1] / m.global.ratio) - 100]
        m.rowList.rowLabelOffset = [[INT(m.rowList.rowLabelOffset[0][0] * m.global.ratio), INT(m.rowList.rowLabelOffset[0][1] * m.global.ratio) - 6]]
        m.rowList.itemSize = [1400, INT(m.rowList.itemSize[1] * m.global.ratio)]
    end if
end sub

sub animateScroll(direction as String)
    if direction = "down" and m.rowFocused < 5
        m.rowFocused++
        for i = 0 to 5
            m.scrollAnimation.getChild(0).keyValue = [[0, m.parent.translation[1]], [0, m.parent.translation[1] - 300]]
        end for
        m.parent.getChild(m.rowFocused).setFocus(true)
        m.scrollAnimation.control = "start"
    else if direction = "up" and m.rowFocused > 0
        m.rowFocused--
        m.scrollAnimation.getChild(0).keyValue = [[0, m.parent.translation[1]], [0, m.parent.translation[1] + 300]]
        m.parent.getChild(m.rowFocused).setFocus(true)
        m.scrollAnimation.control = "start"
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        if key = "down"
            animateScroll(key)
            return true
        else if key = "up"
            animateScroll(key)
            return true
        end if
    end if
end function