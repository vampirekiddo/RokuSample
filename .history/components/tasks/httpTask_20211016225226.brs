sub init()
    m.top.functionname = "handleCalls"
    m.port = createObject("roMessagePort")
    m.top.observeField("request", m.port)
    m.urlRequest = {}
end sub

function handleCalls() as Object
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGNodeEvent"
            if(msg.getField() = "request")
                response = fire(msg.getData())
            end if
        else if msgType = "roUrlEvent"
            if msg.getInt() = 1
                if msg.getResponseCode() > 0
                    response = handleResponse(msg.getString(), msg, true)
                else
                    response = handleResponse(msg.getFailureReason(), msg, false)
                end if
            end if
            m.top.response = response
        end if
    end while
end function

function fire(request as Object) as Object
    httpRequest = initiateHttpClient(request.url)
    requestId = httpRequest.getIdentity().ToStr()
    m.urlRequest[requestId] = {
        request: httpRequest
    }
    if checkRequestType(request.requestType)
        httpRequest.AsyncPostFromString(formatJson(request.payload))
    else
        httpRequest.AsyncGetToString()
    end if
end function

function handleResponse(responseString as String, message as Object, isOk as Boolean) as Object
    if isOk
        body = responseString
    else
        body = "An Error has Occurred!!"
    end if
    requestId = message.GetSourceIdentity().ToStr()
    m.urlRequest[requestId] = invalid
    return {
        requestId: requestId
        body: body
    }
end function

function initiateHttpClient(url as String) as Object
    httpRequest = createObject("roUrlTransfer")
    httpRequest.SetCertificatesFile("common:/certs/ca-bundle.crt")
    httpRequest.InitClientCertificates()
    httpRequest.SetPort(m.port)
    httpRequest.SetUrl(url)
    httpRequest.RetainBodyOnError(false)
    return httpRequest
end function

function checkRequestType(requestType as String) as Boolean
    if requestType = "POST" or requestType = "DELETE" or requestType = "PUT" or requestType = "PATCH"
        return true
    else
        return false
    end if
end function