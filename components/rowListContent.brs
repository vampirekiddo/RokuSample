sub init()
    m.http = createObject("roSGNode", "httpTask")
    m.http.control = "RUN"
    m.http.request = { payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
    }, url: "https://www.youtube.com/watch?v=a3UzkajLu7A", requestType: "GET" }
    m.http.observeFieldScoped("response", "useResponse")
end sub

sub useResponse()
    initialPlayerResponseRegEx = createObject("roRegex", "ytInitialPlayerResponse\s*=\s*({.+?})\s*;", "m")
    matches = initialPlayerResponseRegEx.match(m.http.response.body)
    ?ParseJson(matches[1]).streamingData.formats[0]
end sub
