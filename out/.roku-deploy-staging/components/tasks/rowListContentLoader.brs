sub init()
    m.top.functionname = "handleCalls"
end sub

sub handleCalls()
    fieldPort = createObject("roMessagePort")
    m.top.observeField("request", fieldPort)
    requestMsg = wait(1000, fieldPort)
    ?requestMsg.GetField()
    url = "https://alghool.net/RokuDev/data.json"
    dataGetter = createObject("roUrlTransfer")
    dataGetter.SetCertificatesFile("common:/certs/ca-bundle.crt")
    dataGetter.InitClientCertificates()
    dataGetter.SetURL(url)
    port = createObject("roMessagePort")
    dataGetter.SetPort(port)
    if dataGetter.AsyncGetToString() then
        msg = wait(10000, port)
        if(type(msg) = "roUrlEvent")
            if(msg.getResponseCode() > 0 and msg.getResponseCode() < 400)
                items = ParseJson(msg.getstring())
            else
                items = []
            end if
        else if msg = invalid
            items = []
            dataGetter.asyncCancel()
        end if
    end if

    itemsParent = []
    for each item in items
        RowItem = createObject("roSGNode", "ContentNode")
        RowItem.title = item.Title
        for each record in item.data
            recordData = RowItem.createChild("ContentNode")
            recordData.title = record.title
            recordData.description = record.longDescription
            recordData.HDPosterUrl = record.thumbnail
        end for
        itemsParent.push(RowItem)
    end for
    m.top.listContent = itemsParent
end sub