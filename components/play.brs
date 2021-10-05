sub init()
    m.http = createObject("roSGNode", "httpTask")
    query = "roku"
    m.http.request = { payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
    }, url: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=" + query + "&type=video&key=AIzaSyCxEpZ8-3gkiFpoc2SAkPBfcPFqQd6m_dw", requestType: "GET" }
    m.http.observeFieldScoped("response", "useResponse")
    m.video = m.top.findNode("video")
    m.http.control = "RUN"

    play()
end sub

sub play()
    m.video.control = "play"
end sub

sub useResponse()
    ?m.http.response.body
    ' initialPlayerResponseRegEx = createObject("roRegex", "ytInitialPlayerResponse\s*=\s*({.+?})\s*;", "m")
    ' matches = initialPlayerResponseRegEx.match(m.http.response.body)
    ' m.content = createObject("roSGNode", "ContentNode")
    ' m.content.streamFormat = "mp4"
    ' m.content.url = ParseJson(matches[1]).streamingData.formats[0].url
    ' m.video.content = m.content
    ' play()
end sub

