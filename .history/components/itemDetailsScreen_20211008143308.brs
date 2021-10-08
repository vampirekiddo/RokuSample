sub init()
    m.itemTitle = m.top.findNode("itemTitle")
    m.itemDescription = m.top.findNode("itemDescription")
    m.itemTags = m.top.findNode("itemTags")
    m.itemTime = m.top.findNode("itemTime")
    m.ButtonGroup = m.top.findNode("ButtonGroup")
    m.top.ObserveField("content", "handleItemDetails")
    m.ButtonGroup.focusedTextFont = "font:LargeBoldSystemFont"
    m.ButtonGroup.textFont = "font:LargeBoldSystemFont"
    m.ButtonGroup.vertAlignment = "center"
    m.ButtonGroup.horizAlignment = "center"
end sub

sub handleItemDetails()
    m.itemTitle.text = m.top.content.title
    m.itemDescription.text = m.top.content.description
    m.itemTime.text = "Duration : " + FormatDuration(m.top.content.time) + " Hour(s)"
    if m.top.content.tags <> invalid
        ' tagsCount = m.top.content.tags.Count()
        ' for i = 0 to tagsCount - 1
        '     if i = tagsCount - 1
        '         m.itemTags.text += m.top.content.tags[i]
        '     else
        '         m.itemTags.text += m.top.content.tags[i] + " - "
        '     end if
        ' end for
        seperator = ""
        for each tag in m.top.content.tags
            m.itemTags.text += seperator + tag
            seperator = " - "
        end for
    else
        m.itemTags.text = "No tags available"
    end if
end sub

function FormatDuration(duration as Integer) as String
    minutes = (duration \ 60).ToStr()
    seconds = duration MOD 60
    if seconds < 10
        seconds = "0" + seconds.ToStr()
    else
        seconds = seconds.ToStr()
    end if
    return minutes + ":" + seconds
end function