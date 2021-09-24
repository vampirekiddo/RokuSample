sub init()
    m.keyboard = m.top.findNode("keyboard")
    m.itemsList = m.top.findNode("searchList")
    m.keyboard.setFocus(true)
    m.queryText = "Please enter something to search for .."
    m.keyboard.textEditBox.observeField("text", "handleText")
    m.global.addField("http", "node", FALSE)
    m.global.http = createObject("roSGNode", "httpTask")
    m.global.http.observeFieldScoped("response", "useResponse")
    m.global.http.control = "RUN"
end sub

sub handleText()
    m.global.http.request = { payload: {}, url: "https://api.github.com/users", requestType: "GET" }
end sub

sub useResponse()
    parent = createObject("roSGNode", "ContentNode")
    itemsThatContainString = parent.createChild("ContentNode")
    arr = []

    for each item in m.global.http.response.body
        if item.login.inStr(m.keyboard.textEditBox.text) <> -1
            Content = itemsThatContainString.createChild("ContentNode")
            Content.HDPosterUrl = item.avatar_url
            arr.push(Content)
        end if
    end for
    ?arr.Count()
    m.itemsList.content = parent
end sub