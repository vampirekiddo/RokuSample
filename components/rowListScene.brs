sub init()
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

