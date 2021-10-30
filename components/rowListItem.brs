sub init()
    m.itemPoster = m.top.findNode("itemPoster")
    m.itemTitle = m.top.findNode("itemTitle")
    m.itemMask = m.top.findNode("itemMask")
    m.itemDescription = m.top.findNode("itemDescription")
    m.parentComponent = m.top.getScene()

    ratio = m.global.ratio

    m.itemPoster.scaleRotateCenter = [cint(m.itemPoster.scaleRotateCenter[0] * ratio), cint(m.itemPoster.scaleRotateCenter[1] * ratio)]
    m.itemPoster.width = cint(m.itemPoster.width * ratio)
    m.itemPoster.height = cint(m.itemPoster.height * ratio)
    m.itemPoster.translation = [cint(m.itemPoster.translation[0] * ratio), cint(m.itemPoster.translation[1] * ratio)]

    m.itemMask.width = cint(m.itemMask.width * ratio)
    m.itemMask.height = cint(m.itemMask.height * ratio)
    m.itemMask.scaleRotateCenter = [cint(m.itemMask.scaleRotateCenter[0] * ratio), cint(m.itemMask.scaleRotateCenter[1] * ratio)]

    m.itemTitle.width = cint(m.itemTitle.width * ratio)
    m.itemTitle.translation = [cint(m.itemTitle.translation[0] * ratio), cint(m.itemTitle.translation[1] * ratio)]
    m.itemTitle.scaleRotateCenter = [cint(m.itemTitle.scaleRotateCenter[0] * ratio), cint(m.itemTitle.scaleRotateCenter[1] * ratio)]
    m.itemTitle.font.size = cint(32 * ratio)

    m.itemDescription.width = cint(m.itemDescription.width * ratio)
    m.itemDescription.translation = [cint(m.itemDescription.translation[0] * ratio), cint(m.itemDescription.translation[1] * ratio)]
    m.itemDescription.scaleRotateCenter = [cint(m.itemDescription.scaleRotateCenter[0] * ratio), cint(m.itemDescription.scaleRotateCenter[1] * ratio)]
    m.itemDescription.font.size = cint(16 * ratio)
end sub

sub showContent()
    itemContent = m.top.itemContent
    m.TITLE = itemContent.title
    m.itemPoster.uri = itemContent.hdPosterURL
    m.itemTitle.text = itemContent.title
    m.itemDescription.text = itemContent.description
end sub

sub handleFocus()
    scale = 1 + (m.top.focusPercent * 0.15)
    m.itemPoster.scale = [scale, scale]
end sub

sub handleRowFocus()
    m.itemMask.opacity = 0.85 - (m.top.rowFocusPercent * 0.85)
end sub