sub init()
<<<<<<< HEAD
    m.rowList = m.top.findNode("mainRowList")
    test = createObject("roSGNode", "RowListContent")
    m.rowList.content = createObject("roSGNode", "RowListContent")
    m.rowList.setFocus(true)
    m.global.addField("ratio", "float", FALSE)
    m.global.ratio = 1
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
=======
    m.top.backgroundURI = "pkg:/images/image.jpg"
    m.rowList = m.top.findNode("mainRowList")
    m.rowList.content = createObject("roSGNode", "RowListContent")
    m.rowList.setFocus(true)
    videoMode = createObject("roDeviceInfo")
    m.global.addField("ratio", "float", FALSE)
    m.global.ratio = 1
    if videoMode.GetVideoMode() = "720p"
        m.global.ratio = 0.66
    end if
    m.rowList.translation% = [m.rowList.translation[0] * m.global.ratio, m.rowList.translation[1] * m.global.ratio]
    m.rowList.itemSize% = [m.rowList.itemSize[0] * m.global.ratio, m.rowList.itemSize[1] * m.global.ratio]
    m.rowList.rowItemSize% = [[m.rowList.rowItemSize[0][0] * m.global.ratio, m.rowList.rowItemSize[0][1] * m.global.ratio]]
    m.rowList.rowItemSpacing% = [[m.rowList.rowItemSpacing[0][0] * m.global.ratio, m.rowList.rowItemSpacing[0][1] * m.global.ratio]]
    m.rowList.itemSpacing% = [m.rowList.itemSpacing[0] * m.global.ratio, m.rowList.itemSpacing[1] * m.global.ratio]
end sub

>>>>>>> origin/main
