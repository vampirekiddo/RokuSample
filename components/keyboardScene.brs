sub init()
    m.keyboard = m.top.findNode("myKeyboard")
    m.itemsList = m.top.findNode("searchList")
    m.heading = m.top.findNode("heading")
    m.keyboard.setFocus(true)
    m.keyboard.observeField("text", "handleText")
    m.http = createObject("roSGNode", "httpTask")
    m.http.observeFieldScoped("response", "useResponse")
    m.keyboard.textBox.observeField("text", "handleText")
    m.keyboard.observeField("submit", "handleSubmit")
end sub

sub handleText()
    m.text = m.keyboard.textBox.text
end sub

sub handleSubmit()
    m.http.request = { payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
    }, url: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=" + m.text + "&maxResults=25&type=video&key=AIzaSyCxEpZ8-3gkiFpoc2SAkPBfcPFqQd6m_dw", requestType: "GET" }
    m.http.control = "RUN"
end sub

sub useResponse()
    itemsThatContainString = createObject("roSGNode", "ContentNode")
    items = []
    m.itemsList.numColumns = 3
    for each item in m.http.response.body.items
        Content = itemsThatContainString.createChild("ContentNode")
        Content.HDPosterUrl = item.snippet.thumbnails.medium.url
        items.push(item)
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



' sub getUrl()
'     ' initialPlayerResponseRegEx = createObject("roRegex", "ytInitialPlayerResponse\s*=\s*({.+?})\s*;", "m")
'     ' matches = initialPlayerResponseRegEx.match(m.http.response.body)
'     ' m.content = createObject("roSGNode", "ContentNode")
'     ' m.content.streamFormat = "mp4"
'     ' m.content.url = ParseJson(matches[1]).streamingData.formats[0].url
'     ' m.video.content = m.content
'     ' play()
' end sub

