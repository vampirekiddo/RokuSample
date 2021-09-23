sub init()
    m.keyboard = m.top.findNode("keyboard")
    m.keyboard.setFocus(true)
    m.queryText = "Please enter something to search for .."
    m.keyboard.textEditBox.observeField("text", "handleText")
    m.global.addField("http", "node", FALSE)
    m.global.http = createObject("roSGNode", "httpTask")
    m.global.http.observeFieldScoped("response", "useResponse")
    m.global.http.control = "RUN"
end sub

sub handleText()
    m.queryText = m.keyboard.textEditBox.text
    m.global.http.request = { payload: {}, url: "https://jsonplaceholder.typicode.com/photos", requestType: "GET" }
end sub

sub useResponse()
    itemsThatContainString = []
    for each item in m.global.http.response.body
        if item.title.inStr(m.queryText)
            itemsThatContainString.push(item)
        end if
    end for
    ?itemsThatContainString.Count()
end sub