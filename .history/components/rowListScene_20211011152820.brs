sub init()
    m.parent = m.top.findNode("mainParent")
    store = CreateObject("roSGNode", "ChannelStore")
    store.requestedUserData = "email, phone, firstname, lastname"
    store.command = "getUserData"
end sub

