sub init()
    m.keyboard = m.top.findNode("myKeyboard")
    m.itemsList = m.top.findNode("searchList")
    m.heading = m.top.findNode("heading")
    m.keyboard.setFocus(true)
    m.keyboard.observeField("text", "handleText")
    m.http = createObject("roSGNode", "httpTask")
    m.http.observeFieldScoped("response", "useResponse")
    m.keyboard.textBox.observeField("text", "handleText")
end sub

sub handleText()
    m.http.request = { payload: {}, url: "https://api.github.com/users", requestType: "GET" }
    m.http.control = "RUN"
end sub

sub useResponse()
    itemsThatContainString = createObject("roSGNode", "ContentNode")
    items = []
    m.itemsList.numColumns = 3
    for each item in m.http.response.body
        if item.login.inStr(Lcase(m.keyboard.textBox.text)) <> -1
            Content = itemsThatContainString.createChild("ContentNode")
            Content.HDPosterUrl = item.avatar_url
            items.push(item)
        end if
    end for
    if items.count() = 2
        m.itemsList.numColumns = 2
    else if items.count() = 1
        m.itemsList.numColumns = 1
    end if
    ' handle empty text box
    if m.keyboard.textBox.text = ""
        m.itemsList.content = invalid
        m.heading.visible = false
    else
        m.heading.visible = true
        m.itemsList.content = itemsThatContainString
        handleHeading()
    end if
end sub

sub handleHeading()
    m.heading.text = "These are the top videos that match " + Chr(34) + m.keyboard.textBox.text + Chr(34)
end sub
