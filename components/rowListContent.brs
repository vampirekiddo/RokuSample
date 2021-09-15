sub init()
    dataAsString = ReadAsciiFile("pkg:/components/data.json")
    dataAsJSON = ParseJson(dataAsString)
    dataArray = JsonToContent(dataAsJSON)
end sub

function JsonToContent(items as object) as void
    for each item in items
        RowItem = m.top.createChild("ContentNode")
        for each record in item.data
            recordData = createObject("RoSGNode", "ContentNode")
            recordData.title = record.title
            recordData.description = record.longDescription
            recordData.HDPosterUrl = record.thumbnail
            RowItem.appendChild(recordData)
        end for
    end for
end function

