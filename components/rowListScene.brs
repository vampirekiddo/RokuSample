sub init()
    m.global.addField("ratio", "float", FALSE)
    m.global.ratio = 1.0
    m.mainOverlay = m.top.findNode("mainOverlay")
    m.rowList = m.top.findNode("mainRowList")
    m.heroDetails = m.top.findNode("heroDetails")
    m.providerLogo = m.heroDetails.findNode("providerLogo")
    m.mainBoldLabel = m.heroDetails.findNode("mainBoldLabel")
    m.dateAndDurationLabel = m.heroDetails.findNode("dateAndDurationLabel")
    m.descriptionLabel = m.heroDetails.findNode("descriptionLabel")
    m.categoryLabel = m.heroDetails.findNode("categoryLabel")
    m.fadeInAnimation = m.top.findNode("fadeInAnimation")
    m.fadeOutAnimation = m.top.findNode("fadeOutAnimation")
    m.rowList.content = createObject("roSGNode", "RowListContent")
    m.rowList.setFocus(true)
    m.rowList.observeField("rowItemSelected", "handleItemSelected")
    m.rowList.observeField("rowItemFocused", "onRowItemFocused")
    m.fadeOutAnimation.observeField("state", "handleAnimationDone")


    ' Handling Responsivness
    videoMode = createObject("roDeviceInfo")
    if videoMode.GetVideoMode() = "720p"
        ratio = 2.0 / 3
        m.global.ratio = ratio

        m.mainOverlay.width = cint(m.mainOverlay.width * ratio)
        m.mainOverlay.height = cint(m.mainOverlay.height * ratio)

        print m.heroDetails.translation[0] * ratio, m.heroDetails.translation[0]
        m.heroDetails.translation = [cint(m.heroDetails.translation[0] * ratio), cint(m.heroDetails.translation[1] * ratio)]

        m.providerLogo.translation = [cint(m.providerLogo.translation[0] * ratio), cint(m.providerLogo.translation[1] * ratio)]

        m.mainBoldLabel.translation = [cint(m.mainBoldLabel.translation[0] * ratio), cint(m.mainBoldLabel.translation[1] * ratio)]
        m.mainBoldLabel.width = cint(m.mainBoldLabel.width * ratio)
        m.mainBoldLabel.font.size = cint(46 * ratio)

        m.dateAndDurationLabel.translation = [cint(m.dateAndDurationLabel.translation[0] * ratio), cint(m.dateAndDurationLabel.translation[1] * ratio)]
        m.dateAndDurationLabel.font.size = cint(36 * ratio)

        m.descriptionLabel.translation = [cint(m.descriptionLabel.translation[0] * ratio), cint(m.descriptionLabel.translation[1] * ratio)]
        m.descriptionLabel.width = cint(m.descriptionLabel.width * ratio)
        m.descriptionLabel.font.size = cint(36 * ratio)

        m.categoryLabel.translation = [cint(m.categoryLabel.translation[0] * ratio), cint(m.categoryLabel.translation[1] * ratio)]
        m.categoryLabel.font.size = cint(46 * ratio)

        m.rowList.focusXOffset = [cint(m.rowList.focusXOffset[0] * ratio)]
        m.rowList.translation = [cint(m.rowList.translation[0] * ratio), cint(m.rowList.translation[1] * ratio)]
        m.rowList.rowLabelOffset = [[cint(m.rowList.rowLabelOffset[0][0] * ratio), cint(m.rowList.rowLabelOffset[0][1] * ratio)]]
        m.rowList.itemSize = [cint(m.rowList.itemSize[0] * ratio), cint(m.rowList.itemSize[1] * ratio)]
        m.rowList.rowItemSize = [[cint(m.rowList.rowItemSize[0][0] * ratio), cint(m.rowList.rowItemSize[0][1] * ratio)]]
        m.rowList.rowHeights = [cint(m.rowList.rowHeights[0] * ratio)]
    end if
end sub

' animate the changing of the background's data on item focus change
sub handleAnimationDone()
    if m.fadeOutAnimation.state = "stopped"
        m.mainOverlay.uri = getItem(m.rowList.rowItemFocused).hdPosterURL
        m.fadeInAnimation.control = "start"
    end if
end sub

' Clicking a Row List item
sub handleItemSelected()
    m.itemDetailsScreen = createObject("roSGNOde", "ItemDetailsScreen")
    m.itemDetailsScreen.content = getItem(m.rowList.rowItemSelected)
    m.itemDetailsScreen.visible = false
    m.top.appendChild(m.itemDetailsScreen)
    toggleDetails()
end sub

function getItem(item as object) as object
    return m.rowList.content.getChild(item[0]).getChild(item[1])
end function

sub onRowItemFocused()
    item = getItem(m.rowList.rowItemFocused)
    m.mainBoldLabel.text = item.title
    m.dateAndDurationLabel.text = "21 Sep 21 | 3m"
    m.descriptionLabel.text = item.description
    m.categoryLabel.text = "World"
    m.fadeOutAnimation.control = "start"
end sub

' Toggle if the details screen is visible or not
sub toggleDetails()
    m.rowList.visible = not m.rowList.visible
    m.heroDetails.visible = not m.heroDetails.visible
    m.itemDetailsScreen.visible = not m.itemDetailsScreen.visible
    if m.itemDetailsScreen.visible
        m.itemDetailsScreen.setFocus(true)
    else
        m.rowList.setFocus(true)
        m.itemDetailsScreen = invalid
    end if
end sub

' Handling navigating and exiting the Details Screen
function onKeyEvent(key as string, press as boolean) as boolean
    if press then
        print "onKeyEvent "; key
        if key = "back" and m.itemDetailsScreen = invalid
            return false
        else if key = "back" and m.itemDetailsScreen.visible
            toggleDetails()
            return true
        else if key = "right" and m.itemDetailsScreen.visible
            m.itemDetailsScreen.callFunc("focusPlus")
            return true
        else if key = "left" and m.itemDetailsScreen.visible
            m.itemDetailsScreen.callFunc("focusWatch")
            return true
        end if
    end if
    return false
end function