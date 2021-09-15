sub init()
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
end sub