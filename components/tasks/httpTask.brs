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
        else if type(msg) = "roUrlEvent"
                if msg.getInt() = 1
                    if msg.getResponseCode() > 0
                        response = handleResponse(msg.getString(),msg,true)
                    else
                        response = handleResponse(msg.getFailureReason(),msg,false)
                    end if
                end if
                m.http.asyncCancel()
                m.top.response = response
                return response
        end if
    end while
end function

function fire(request as Object) as Object
    m.http = initiateHttpClient(request.url)
    requestId = m.http.getIdentity().ToStr()
    m.urlRequest[requestId] = m.http
    if checkRequestType(request.requestType)
        m.http.AsyncPostFromString(FormatJson(request.payload))
    else
        m.http.AsyncGetToString()
    end if
end function

function handleResponse(responseString as String, message as Object, isOk as Boolean) as Object
    if isOk
        body = parseJson(responseString)
    else
        body = "An Error has Occurred!!"
    end if
        requestId = message.GetSourceIdentity().ToStr()
    return {
        requestId: requestId
        body:body
    }
end function

function initiateHttpClient(url as String) as Object
    http = createObject("roUrlTransfer")
    http.SetCertificatesFile("common:/certs/ca-bundle.crt")
    http.InitClientCertificates()
    http.SetPort(m.port)
    http.SetUrl(url)
    http.RetainBodyOnError(true)
    http.addHeader("Content-Type", "application/json")
    http.addHeader("Accept", "application/json")
    return http
end function

function checkRequestType(requestType as String) as Boolean
    if requestType = "POST" or requestType = "DELETE" or requestType = "PUT" or requestType = "PATCH"
        return true
    else
        return false
    end if
end function