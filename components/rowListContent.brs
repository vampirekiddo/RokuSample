sub init()
    m.global.http.request = { payload: {
            userId: 1,
            title: "WOW, IT WORKED ^_^",
    }, url: "https://alghool.net/RokuDev/data.json", requestType: "GET"}
    m.global.http.observeFieldScoped("response", "populateRowList")
end sub

sub populateRowList()
    items = m.global.http.response.body
    for each item in items
        itemNode = m.top.createChild("ContentNode")
        itemNode.title = item.title
        for each data in item.data
            itemData = itemNode.createChild("ContentNode")
            itemData.title = data.title
            itemData.HDPosterUrl = data.thumbnail
            itemData.description = data.longDescription
        end for
        m.top.appendChild(itemNode)
    end for
end sub
