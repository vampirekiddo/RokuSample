sub init()
    m.top.functionname = "handleCalls"
    m.port = createObject("roMessagePort")
    m.top.observeField("request", m.port)
end sub

sub handleCalls()
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGNodeEvent"
            if(msg.getField() = "request")
                response = fire(msg.getData())
                m.top.response = response
            end if
        end if
    end while
end sub

function fire(request as object) as object
    port = createObject("roMessagePort")
    http = initiateHttpClient(request.url, port)
    if checkRequestType(request.requestType)
        http.AsyncPostFromString(FormatJson(request.payload))
    else
        http.AsyncGetToString()
    end if
    msg = wait(0, port)
    if type(msg) = "roUrlEvent" then
        if msg.getInt() = 1
            if msg.getResponseCode() > 0
                response = handleResponse(msg.getString(), request, true)
            else
                response = handleResponse(msg.getFailureReason(), request, false)
            end if
        end if
        http.asyncCancel()
        return response
    end if
end function

function handleResponse(responseString as string, request as object, isOk as boolean) as object
    if isOk
        body = ParseJson(responseString)
    else
        body = "An Error has Occurred!!"
    end if
    response = {
        requestId: request.requestId
        body: body
        details: request
    }
    return response
end function


function initiateHttpClient(url as string, port as object) as object
    http = createObject("roUrlTransfer")
    http.SetCertificatesFile("common:/certs/ca-bundle.crt")
    http.InitClientCertificates()
    http.SetPort(port)
    http.SetUrl(url)
    http.RetainBodyOnError(true)
    http.addHeader("Content-Type", "application/json")
    http.addHeader("Accept", "application/json")
    return http
end function

function checkRequestType(requestType as string) as boolean
    if requestType = "POST" or requestType = "DELETE" or requestType = "PUT" or requestType = "PATCH"
        return 1
    else
        return 0
    end if
end function