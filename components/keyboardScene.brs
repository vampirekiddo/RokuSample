sub init()
    m.keyboard = m.top.findNode("keyboard")
    m.itemsList = m.top.findNode("searchList")
    m.heading = m.top.findNode("heading")
    m.keyboard.setFocus(true)
    m.queryText = "Please enter something to search for .."
    m.keyboard.textEditBox.observeField("text", "handleText")
    m.http = createObject("roSGNode", "httpTask")
    m.http.observeFieldScoped("response", "useResponse")
    m.http.control = "RUN"
end sub

sub handleText()
    m.http.request = { payload: {}, url: "https://api.github.com/users", requestType: "GET" }
end sub

sub useResponse()
    itemsThatContainString = createObject("roSGNode", "ContentNode")
    items = []
    for each item in m.http.response.body
        if item.login.inStr(m.keyboard.textEditBox.text) <> -1
            Content = itemsThatContainString.createChild("ContentNode")
            Content.HDPosterUrl = item.avatar_url
            items.push(item)
        end if
    end for
    ' handle empty text box
    if m.keyboard.textEditBox.text = ""
        m.itemsList.content = invalid
        m.heading.visible = false
    else
        m.heading.visible = true
        m.itemsList.content = itemsThatContainString
        handleHeading()
    end if
end sub

sub handleHeading()
    m.heading.text = "These are the top videos that match " + Chr(34) + m.keyboard.textEditBox.text + Chr(34)
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    if press
        if key = "right" and not m.itemsList.hasFocus()
            m.itemsList.setFocus(true)
            handled = true
        else if key = "left" and not m.keyboard.hasFocus()
            m.keyboard.setFocus(true)
            handled = true
        end if
    end if
    return handled
end function