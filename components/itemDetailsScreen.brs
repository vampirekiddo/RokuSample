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
    if m.top.content.tags <> invalid
        tagsCount = m.top.content.tags.Count()
        for i = 0 to tagsCount - 1
            if i = tagsCount - 1
                m.itemTags.text += m.top.content.tags[i]
            else
                m.itemTags.text += m.top.content.tags[i] + " - "
            end if
        end for
    else
        m.itemTags.text = "No tags available"
    end if
    m.watchButton.setFocus(true)
end sub