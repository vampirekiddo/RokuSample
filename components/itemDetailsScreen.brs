sub init()
    m.mainContent = m.top.findNode("mainContent")
    m.itemTitle = m.mainContent.findNode("itemTitle")
    m.itemDescription = m.mainContent.findNode("itemDescription")
    m.itemTags = m.mainContent.findNode("itemTags")
    m.itemTime = m.mainContent.findNode("itemTime")
    m.ButtonGroup = m.mainContent.findNode("ButtonGroup")
    m.top.ObserveField("content", "handleItemDetails")
    m.ButtonGroup.focusedTextFont = "font:LargeBoldSystemFont"
    m.ButtonGroup.textFont = "font:LargeBoldSystemFont"
    m.ButtonGroup.vertAlignment = "center"
    m.ButtonGroup.horizAlignment = "center"


    ratio = m.global.ratio

    m.mainContent.translation = [cint(m.mainContent.translation[0] * ratio), cint(m.mainContent.translation[1] * ratio)]

    m.watch = m.ButtonGroup.findNode("watch")
    m.plus = m.ButtonGroup.findNode("plus")
end sub

sub handleItemDetails()
    m.itemTitle.text = m.top.content.title
    m.itemDescription.text = m.top.content.description
    m.itemTime.text = "Duration : " + formatDuration(m.top.content.time) + " Hour(s)"
    if m.top.content.tags <> invalid
        seperator = ""
        for each tag in m.top.content.tags
            m.itemTags.text += seperator + tag
            seperator = " - "
        end for
    else
        m.itemTags.text = "No tags available"
    end if
end sub

function formatDuration(duration as integer) as string
    minutes = (duration \ 60).toStr()
    seconds = (duration MOD 60).toStr()
    if len(seconds) < 2
        seconds = "0" + seconds
    end if
    return minutes + ":" + seconds
end function

sub focusWatch()
    m.watch.setFocus(true)
end sub

sub focusPlus()
    m.plus.setFocus(true)
end sub
