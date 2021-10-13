sub init()
    m.parent = m.findNode("mainParent")
    m.MultiStyleLabel.drawingStyles = {

        "HandprintedRed": {
            "fontSize": 36
            "fontUri": "pkg:/fonts/vSHandprinted.otf"
            "color": "#FF0000FF"
        }
        "HandprintedGreen": {
            "fontSize": 36
            "fontUri": "pkg:/fonts/vSHandprinted.otf"
            "color": "#00FF00FF"
        }
        "default": {
            "fontSize": 36
            "fontUri": "font:LargeSystemFont"
            "color": "#000000FF"
        }
    }
    m.MultiStyleLabel.text = "Default Text <HandprintedRed>Red text followed by</HandprintedRed><HandprintedGreen>more text in a funny style thaty the world has never seen before...</HandprintedGreen>"
    store = CreateObject("roSGNode", "ChannelStore")
    ' Request several properties for sign-up
    store.requestedUserData = "email, phone, firstname, lastname"
    store.command = "getUserData"
    ?store.userData.firstName
end sub

sub libraryLoaded()
    if (m.SampleComponentLib.loadStatus = "ready")
        loadingNode = createObject("roSGNode", "LoadingScreen")
        m.parent.appendChild(loadingNode)
    end if
end sub