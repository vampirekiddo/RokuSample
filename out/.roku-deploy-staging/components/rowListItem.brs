sub init()
<<<<<<< HEAD
    m.itemPoster = m.top.findNode("itemPoster")
    m.itemTitle = m.top.findNode("itemTitle")
    m.itemMask = m.top.findNode("itemMask")
    m.itemDescription = m.top.findNode("itemDescription")
end sub

sub showContent()
    itemContent = m.top.itemContent
    m.TITLE = itemContent.title
    m.itemPoster.uri = itemContent.HDPosterUrl
    m.itemTitle.text = itemContent.title
    m.itemDescription.text = itemContent.description
    m.itemTitle.font.size = INT(32 * m.global.ratio)
    m.itemDescription.font.size = INT(24 * m.global.ratio)
    m.itemTitle.width = INT(m.itemTitle.width * m.global.ratio)
    m.itemDescription.width = INT(m.itemDescription.width * m.global.ratio)
    m.itemTitle.translation = [INT(m.itemTitle.translation[0] * m.global.ratio), INT(m.itemTitle.translation[1] * m.global.ratio)]
    m.itemDescription.translation = [INT(m.itemDescription.translation[0] * m.global.ratio), INT(m.itemDescription.translation[1] * m.global.ratio)]
    m.itemMask.width = INT(m.itemMask.width * m.global.ratio)
    m.itemMask.height = INT(m.itemMask.height * m.global.ratio)
    m.itemPoster.width = INT(m.itemPoster.width * m.global.ratio)
    m.itemPoster.height = INT(m.itemPoster.height * m.global.ratio)
end sub

sub handleFocus()
    scale = 1 + (m.top.focusPercent * 0.15)
    m.itemPoster.scale = [scale, scale]
end sub

sub handleRowFocus()
    focusPercent = m.top.rowFocusPercent
    m.itemMask.opacity = 0.85 - (focusPercent * 0.85)
=======
    m.itemposter = m.top.findNode("itemPoster")
    m.itemTitle = m.top.findNode("itemTitle")
    m.itemDescription = m.top.findNode("itemDescription")
end sub

sub showcontent()
    itemcontent = m.top.itemContent
    m.itemposter.uri = itemcontent.HDPosterUrl
    m.itemTitle.text = itemcontent.title
    m.itemDescription.text = itemcontent.description
    m.itemTitle.font.size% = 32 * m.global.ratio
    m.itemDescription.font.size% = 24 * m.global.ratio
    m.itemTitle.width% = m.itemTitle.width * m.global.ratio
    m.itemDescription.width% = m.itemDescription.width * m.global.ratio
    m.itemTitle.translation% = [m.itemTitle.translation[0] * m.global.ratio, m.itemTitle.translation[1] * m.global.ratio]
    m.itemDescription.translation% = [m.itemDescription.translation[0] * m.global.ratio, m.itemDescription.translation[1] * m.global.ratio]
end sub

sub handleFocus()
    m.top.scale = [1, 1]
    if m.top.itemHasFocus = true and m.top.rowHasFocus = true
        m.top.scale = [1.15, 1.15]
    end if
>>>>>>> origin/main
end sub