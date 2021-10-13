sub init()
    m.parent = m.findNode("mainParent")
    store = CreateObject("roSGNode", "ChannelStore")
    store.requestedUserData = "email, phone, firstname, lastname"
    store.command = "getUserData"
    ?store.userData.firstName
end sub

