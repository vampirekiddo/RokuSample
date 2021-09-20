sub init()
    m.JSONGetTask = createObject("roSGNode", "rowListContentLoader")
    m.JSONGetTask.control = "RUN"
    m.JSONGetTask.observeField("listContent", "onResponseDone")
end sub

sub onResponseDone()
    m.top.appendChildren(m.JSONGetTask.listContent)
end sub
