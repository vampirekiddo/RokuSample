sub init()
    m.global.http.request = { payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
    }, url: "https://jsonplaceholder.typicode.com/albums", requestType: "GET"}
    m.global.http.observeFieldScoped("response", "useResponse")
end sub

sub useResponse()
    ?"HELLO     "
    ?m.global.http.response
end sub
