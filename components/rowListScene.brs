sub init()
    m.global.addField("ratio", "float", FALSE)
    m.flag = true
    m.global.ratio = 1
    m.rowList = m.top.findNode("mainRowList")
    m.currFocus = invalid
    m.MainBoldLabel = m.top.findNode("MainBoldLabel")
    m.DateAndDurationLabel = m.top.findNode("DateAndDurationLabel")
    m.DescriptionLabel = m.top.findNode("DescriptionLabel")
    m.CategoryLabel = m.top.findNode("CategoryLabel")
    m.fadeInAnimation = m.top.findNode("fadeInAnimation")
    m.fadeOutAnimation = m.top.findNode("fadeOutAnimation")
    m.rowList.content = createObject("roSGNode", "RowListContent")
    m.rowList.setFocus(true)
    m.rowList.findNode("RowListItem")
    m.top.observeField("HeroDetails", "handleHeroDetails")
    m.rowList.observeField("rowItemSelected", "handleItemSelected")
    m.fadeOutAnimation.observeField("state", "handleAnimationDone")
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

sub handleHeroDetails()
    if m.flag
        m.flag = false
        handleUpdate()
    else
        handleItemFocusChange()
    end if
end sub

sub handleAnimationDone()
    if m.fadeOutAnimation.state = "stopped"
        handleUpdate()
        m.fadeInAnimation.control = "start"
    end if
end sub

sub handleItemFocusChange()
    m.fadeOutAnimation.control = "start"
end sub

sub handleUpdate()
    m.MainBoldLabel.text = m.top.HeroDetails.MainBoldLabel
    m.DateAndDurationLabel.text = m.top.HeroDetails.DateAndDurationLabel
    m.DescriptionLabel.text = m.top.HeroDetails.DescriptionLabel
    m.CategoryLabel.text = m.top.HeroDetails.CategoryLabel
end sub

sub handleItemSelected()
    itemDetailsNode = m.rowList.content.getChild(m.rowList.rowItemSelected[0]).getChild(m.rowList.rowItemSelected[1])
    m.itemDetailsScreen = createObject("roSGNode", "itemDetailsScreen")
    m.itemDetailsScreen.content = itemDetailsNode
    m.top.appendChild(m.itemDetailsScreen)
    m.rowList.visible = false
    m.MainBoldLabel.visible = false
    m.CategoryLabel.visible = false
    m.DescriptionLabel.visible = false
    m.DateAndDurationLabel.visible = false
    m.itemDetailsScreen.visible = true
    m.itemDetailsScreen.setFocus(true)
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press
        if key = "back" and m.itemDetailsScreen.visible = true
            m.MainBoldLabel.visible = true
            m.CategoryLabel.visible = true
            m.DescriptionLabel.visible = true
            m.DateAndDurationLabel.visible = true
            m.rowList.visible = true
            m.rowList.setFocus(true)
            m.itemDetailsScreen.visible = false
            handled = true
        else
            handled = false
        end if
    end if
    return handled
end function