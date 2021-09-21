sub init()
    m.requestId = "rowListContentApiCall"
    m.global.http.request = { payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
    }, url: "https://jsonpslaceholder.typicode.com/albums", requestType: "POST", requestId: m.requestId }
    m.global.http.observeField("response", "useResponse")
end sub

sub useResponse()
    response = m.global.http.response
    if response.requestId = m.requestid
        ?response
    end if
end sub
