sub init()
    m.global.addField("ratio", "float", FALSE)
    m.flag = true
    m.global.ratio = 1
    m.rowList = m.top.findNode("mainRowList")
    m.heroDetailsId = m.top.findNode("heroDetailsId")
    m.MainBoldLabel = m.heroDetailsId.findNode("MainBoldLabel")
    m.DateAndDurationLabel = m.heroDetailsId.findNode("DateAndDurationLabel")
    m.DescriptionLabel = m.heroDetailsId.findNode("DescriptionLabel")
    m.CategoryLabel = m.heroDetailsId.findNode("CategoryLabel")
    m.fadeInAnimation = m.top.findNode("fadeInAnimation")
    m.fadeOutAnimation = m.top.findNode("fadeOutAnimation")
    m.rowList.content = createObject("roSGNode", "RowListContent")
    m.rowList.setFocus(true)
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
    m.createScreen = createObject("roSGNOde", "ItemDetailsScreen")
    itemDetailsNode = m.rowList.content.getChild(m.rowList.rowItemSelected[0]).getChild(m.rowList.rowItemSelected[1])
    m.createScreen.content = itemDetailsNode
    m.top.appendChild(m.createScreen)
    m.createScreen.visible = false
    toggleDetails()
end sub

sub toggleDetails()
    m.rowList.visible = not m.rowList.visible
    m.heroDetailsId.visible = not m.heroDetailsId.visible
    m.createScreen.visible = not m.createScreen.visible
    if m.createScreen.visible
        m.createScreen.setFocus(true)
    else
        m.rowList.setFocus(true)
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press then
        if key = "back" and m.createScreen.visible
            toggleDetails()
            return true
        else if key = "right" and m.createScreen.visible
            m.createScreen.getChild(0).getChild(4).getChild(1).setFocus(true)
            return true
        else if key = "left" and m.createScreen.visible
            m.createScreen.getChild(0).getChild(4).getChild(0).setFocus(true)
            return true
        end if
    end if
    return false
end function