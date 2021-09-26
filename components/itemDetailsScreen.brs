sub init()
    m.itemTitle = m.top.findNode("itemTitle")
    m.watchButton = m.top.findNode("watchButton")
    m.itemDescription = m.top.findNode("itemDescription")
    m.itemTags = m.top.findNode("itemTags")
    m.top.ObserveField("content", "handleItemDetails")
end sub

sub handleItemDetails()
    m.itemTitle.text = m.top.content.TITLE
    m.itemDescription.text = m.top.content.DESCRIPTION
    m.watchButton.setFocus(true)
end sub