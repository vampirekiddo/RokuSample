sub init()
    m.http = createObject("roSGNode", "httpTask")
    m.http.request = {
        payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
        },
        url: "https://alghool.net/RokuDev/data.json",
        requestType: "GET"
    }
    m.http.control = "RUN"
    m.http.observeFieldScoped("response", "populateRowList")
end sub

sub populateRowList()
    for each item in m.http.response.body
        itemNode = m.top.createChild("ContentNode")
        itemNode.title = item.title
        for each data in item.data
            itemData = itemNode.createChild("rowItemDataContent")
            itemData.setFields({
                title: data.title
                hdPosterURL: data.thumbnail
                description: data.longDescription
                tags: data.tags
                time: data.time
            })
        end for
        m.top.appendChild(itemNode)
    end for
end sub
