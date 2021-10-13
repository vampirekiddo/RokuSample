sub init()
    m.http = createObject("roSGNode", "httpTask")
    m.http.control = "RUN"
    m.http.request = { payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
    }, url: "https://www.youtube.com/watch?v=1FL22N1EXDo", requestType: "GET" }
    m.http.observeFieldScoped("response", "useResponse")
    m.video = m.top.findNode("video")
    ?m.video

    play()
end sub

sub play()
    m.video.control = "play"
end sub

sub useResponse()
    initialPlayerResponseRegEx = createObject("roRegex", "ytInitialPlayerResponse\s*=\s*({.+?})\s*;", "m")
    matches = initialPlayerResponseRegEx.match(m.http.response.body)
    m.content = createObject("roSGNode", "ContentNode")
    m.content.streamFormat = "mp4"
    m.content.url = ParseJson(matches[1]).streamingData.formats[0].url
    m.video.content = m.content
    play()
end sub

