sub init()
    m.parent = m.findNode("mainParent")
    store = CreateObject("roSGNode", "ChannelStore")
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